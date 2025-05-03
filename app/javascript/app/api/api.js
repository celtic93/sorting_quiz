import axios from 'axios';

const APP_URL = 'http://localhost:3000';

const csrfToken = document.querySelector('[name=csrf-token]').content;
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken;

export const getCurrentRoundQuestion = async () => {
  const response = await axios.get(`${APP_URL}/current_round_questions`);
  return response.data;
};

export const updateRoundOption = async ({ id, params }) => {
  const response = await axios.put(`${APP_URL}/round_options/${id}`, params);
  return response.data;
};

