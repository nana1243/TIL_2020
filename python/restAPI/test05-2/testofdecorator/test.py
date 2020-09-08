import jwt

from functools  import wraps
from flask 		import request, Response

def login_required(f):      									# 1)
    @wraps(f)                   								# 2)
    def decorated_function(*args, **kwargs):
        access_token = request.headers.get('Authorization') 	# 3)
        if access_token is not None:  							# 4)
            try:
                payload = jwt.decode(access_token, current_app.config['JWT_SECRET_KEY'], 'HS256') 				   # 5)
            except jwt.InvalidTokenError:
                 payload = None     							# 6)

            if payload is None: return Response(status=401)  	# 7)

            user_id   = payload['user_id']  					# 8)
            g.user_id = user_id
            g.user    = get_user(user_id) if user_id else None
        else:
            return Response(status = 401)  						# 9)

        return f(*args, **kwargs)
    return decorated_function