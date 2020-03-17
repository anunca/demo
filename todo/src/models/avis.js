import mongoose from 'mongoose';
const todosSchema = new mongoose.Schema({
  comment: {
    type: String,
    unique: false,
  },
});
const Todos = mongoose.model('Todos', todosSchema);
export default Todos;