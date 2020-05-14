
// hasOwnProperty() practice


let sample={20123215:"che"};

console.log(sample.hasOwnProperty(20123215)); // true
console.log(sample.hasOwnProperty("hennie")); // false
console.log(sample.hasOwnProperty("che")); // false

let values=[1,2,2,2,3,4,5];
console.log(values.hasOwnProperty(2)); //true
console.log(values.hasOwnProperty(12)); // false


let val = [[1,"green"], [2,"green"] , [3,"green"] ,[1,"green"],[1,"tulip"]];
console.log(val);
let uniqueval = val.filter((item,pos)=>{
    if(!this.hasOwnProperty(item)){
        return this[item] = true;
    }
    return false;
}, {});
