// user 스키마가 들어 있는 코드


const mongoose = require('mongoose');

const { Schema } = mongoose; // 몽구스안에 스키마속성을 가져온다
const userSchema = new Schema({
  name: {
    type: String,
    required: true,
    unique: true,
  },
  age: {
    type: Number,
    required: true,
  },
  married: {
    type: Boolean,
    required: true,
  },
  comment: String,
  createdAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model('User', userSchema);

// mongoose.model(모델명, 스키마, 컬렉션명)