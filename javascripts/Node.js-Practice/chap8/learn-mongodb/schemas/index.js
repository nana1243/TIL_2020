// mongodb를 연결하는 코드

const mongoose = require('mongoose');

// mongo db를 연결하는 코드를 작성
//

module.exports = () => {
  const connect = () => {
    if (process.env.NODE_ENV !== 'production') {
      mongoose.set('debug', true);
    }
    mongoose.connect('mongodb://root:nodejsbook@localhost:27017/admin', {
      dbName: 'nodejs',
    }, (error) => {
      if (error) {
        console.log('몽고디비 연결 에러', error);
      } else {
        console.log('몽고디비 연결 성공');
      }
    });
  };
  connect();
  // 만약에 에러낫을때(indb) or disconnect = > 재시도하는 코드 아래
  mongoose.connection.on('error', (error) => {
    console.error('몽고디비 연결 에러', error);
  });
  mongoose.connection.on('disconnected', () => {
    console.error('몽고디비 연결이 끊겼습니다. 연결을 재시도합니다.');
    connect();
  });

  require('./user');
  require('./comment');
};
