
from flask_sqlalchemy import SQLAlchemy

from api.model.IdModel import IdModel

db = SQLAlchemy(model_class=IdModel)
