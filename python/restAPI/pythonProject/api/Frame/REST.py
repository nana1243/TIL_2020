
from api.utils.responses import response_with
from api.utils import responses as resp

class RESTAPI:
    def __init__(self,convience_name):
        self.convience_name =convience_name

    def get_all(self,volist_name,volist):
        return response_with(resp.SUCCESS_200, value={volist_name: volist})

    def get_detail(self):
        pass

    def get_search(self):
        pass

    def put(self):
        pass
    def delete(self):
        pass
    def update(self):
        pass
