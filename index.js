import express from 'express';
import { createServer } from 'node:http';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { Server } from 'socket.io';
import { PrismaClient } from '@prisma/client';
// import {jsonwebtoken} from 'jsonwebtoken';
// import jwt from 'jsonwebtoken';
// import cors from 'cors';

const app = express();
const prisma = new PrismaClient();
const server = createServer(app);
const io = new Server(server);

// const path = require('path');

const __dirname = dirname(fileURLToPath(import.meta.url));

// app.use(express.urlencoded({ extended: true }));
// app.use(express.json());

// Use the cors middleware
// app.use(cors());







app.get('/', (req, res) => {
  res.sendFile(join(__dirname, 'index.html'));

  // console.log(import.meta.url);
  // console.log(fileURLToPath(import.meta.url));
  // console.log(dirname(fileURLToPath(import.meta.url)));
});




// socket code starts here 

io.on('connection', (socket) => {
  console.log('a user connected');

  socket.on('disconnect', () => {
    console.log('user disconnected');
  });

  socket.on('join chat', async({senderId, receiverId}) => {

    try {      
      const firstConditionMessages = await prisma.message.findMany({
        where: {
          receiver_id: parseInt(receiverId),
          sender_id: parseInt(senderId),
        },
        select: {
          message: true,
        },
      });

      const secondConditionMessages = await prisma.message.findMany({
        where: {
          receiver_id: parseInt(senderId),
          sender_id: parseInt(receiverId),
        },
        select: {
          message: true,
        },
      });

      
      const firstCondtionAllMsgs = firstConditionMessages;
      const secondCondtionAllMsgs = secondConditionMessages;

      // const allMessages = [...firstConditionMessages, ...secondConditionMessages];
        
      socket.emit('previous messages', {firstCondtionAllMsgs, secondCondtionAllMsgs});

    } catch (error) {
        console.error('Error retrieving previous messages:', error);
    }

  });




  socket.on('chat message', async (msg) => {    
    const { senderId, receiverId, message } = msg;     

    try {      
      await prisma.message.create({
        data: {
          sender_id: senderId,
          receiver_id: receiverId,
          message: message,          
        },
      });
      
      socket.broadcast.emit('chat message', msg);

      console.log('Message stored in the database');
    } catch (error) {
      console.error('Error storing message:', error);
    }

  });


 

});







// SERVER 

server.listen(1000, () => {
  console.log('server running at http://localhost:1000');
});