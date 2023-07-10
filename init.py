from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import os


app = Flask(__name__)


#if not (os.environ.get("SQLALCHEMY_DATABASE_URI") == None):
#DB_URI = f'postgresql://{os.environ.get("DATABASE_USER")}:{os.environ.get("DATABASE_PW")}@{os.environ.get("DATABASE_HOST")}:{os.environ.get("DATABASE_PORT")}/{os.environ.get("DATABASE_NAME")}'
DB_URI = f'postgresql://postgres:q7963q@db:5432/SPOTLARDB' # db, host.docker.internal
app.config['SQLALCHEMY_DATABASE_URI'] = DB_URI
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


app.config["JSON_SORT_KEYS"] = False
app.config['SECRET_KEY'] = os.environ.get("SECRET_KEY")


cors = CORS(app, resources={r"/*": {"origins": "*"}})


"""
Nossa Senhora, Maria, passa na frente!
"""