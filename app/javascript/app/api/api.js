import axios from 'axios';

export const getCurrentRoundQuestion = async () => {
  const response = await axios.get('http://localhost:3000/current_round_questions'); // Замените на ваш URL
  return response.data;
};
