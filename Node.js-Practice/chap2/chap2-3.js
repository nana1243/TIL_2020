// 객체 리터럴
var sayNode = function(){
    console.log('NODE');
}

var e = 'ES';

var oldObject = {
    sayJS: function(){
        console.log('JS');
    },
    sayNode: sayNode,
}

oldObject[e +6]='Fantastic';


console.log(sayNode());
console.log(oldObject.sayNode());