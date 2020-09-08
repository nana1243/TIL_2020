import json


class ModelFrame:
    def __init__(self):
        pass


    def makeJSON(self):
        d = {"productname".strip():0 , "price".strip():0, "servicename".strip():0}
        return d

    def Parsing(self,queryset):
        json_productAll = {elm.id: 0 for elm in queryset}
        for elm in queryset:
            d = self.makeJSON()
            d["productname"] = elm.productname
            d["price"] = elm.price
            d["servicename"] = elm.servicename
            json.dumps(d, ensure_ascii=False, sort_keys=True, separators=(',', ':')).encode('utf-8')
            json_productAll[elm.id] = d
        return json_productAll





