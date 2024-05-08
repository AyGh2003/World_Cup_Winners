from fastapi import Depends, FastAPI, HTTPException, status
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from jose import JWTError, jwt
from passlib.context import CryptContext
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String, select
import databases

app = FastAPI()

# Settings
SECRET_KEY = "It's just a key"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30
auth = HTTPBearer()
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


# Database Configuration
DATABASE_URL = "mysql://root:password@localhost:3306/world_cup" 

database = databases.Database(DATABASE_URL)
engine = create_engine(DATABASE_URL)
metadata = MetaData(bind=engine)

edition = Table(
    'podium',
    metadata,
    Column('World_cup_edition', Integer, primary_key=True),
    Column('Winner', String(30)),
    Column('Runner_up', String(30)),
    Column('Third_place', String(30))
)


# Authentication and Authorization Functions
def get_password_hash(password):
    return pwd_context.hash(password)


def verify_password(plain_password, hashed_password):
    return pwd_context.verify(plain_password, hashed_password)


def authenticate_user(username, password):
    if username == "Aymen" and verify_password(password, get_password_hash("worldcup")):
        return {"username": username}
    return None


def create_access_token(data: dict):
    to_encode = data.copy()
    access_token = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return access_token

 
def get_current_user(token: str = Depends(auth)):
    try:
        payload = jwt.decode(token.credentials, SECRET_KEY,
                             algorithms=[ALGORITHM])
        username = payload.get("sub")
        if username is None:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")
    except JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid token")

    return {"username": username}


# The main fonctions :

@app.on_event("startup")
async def startup():
    await database.connect()


@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()


@app.post("/login")
async def login(username: str, password: str):
    user = authenticate_user(username, password)
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, detail="Invalid credentials")

    access_token = create_access_token({"sub": user["username"]})
    return {"access_token": access_token, "token_type": "bearer"}


@app.get("/world_cup")
async def get_world_cup_results():
    query = select([edition])
    result = await database.fetch_all(query)

    results_list = []
    for row in result:
        row_dict = dict(row)
        results_list.append(row_dict)

    return results_list


@app.post("/world_cup")
async def create_world_cup_result(world_cup_result: dict, user: dict = Depends(get_current_user)):
    query = edition.insert().values(world_cup_result)
    await database.execute(query)
    return {"message": "World Cup result created successfully"}


@app.put("/world_cup/{edition_id}")
async def update_world_cup_result(edition_id: int, world_cup_result: dict, user: dict = Depends(get_current_user)):
    query = edition.update().where(edition.c.World_cup_edition ==
                                   edition_id).values(world_cup_result)
    await database.execute(query)
    return {"message": "World Cup result updated successfully"}


@app.delete("/world_cup/{edition_id}")
async def delete_world_cup_result(edition_id: int, user: dict = Depends(get_current_user)):
    query = edition.delete().where(edition.c.World_cup_edition == edition_id)
    await database.execute(query)
    return {"message": "World Cup result deleted successfully"}
