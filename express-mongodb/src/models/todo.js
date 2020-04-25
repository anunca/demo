import mongoose from 'mongoose';

const todoSchema = new mongoose.Schema({
  title: {
    type: String,
    unique: true,
  },
});

const todo = mongoose.model('todo', todoSchema);

export default todo;
