import React, { useState, useEffect } from 'react';
import { DragDropContext } from 'react-beautiful-dnd';
import { useQuery, useMutation } from '@tanstack/react-query';
import { getCurrentRoundQuestion, updateRoundOption } from '../../../api/api';
import RoundAnswers from '../RoundAnswers';
import RoundOption from '../RoundOption';

const Round = () => {
  const { data, isLoading, isError } = useQuery({
    queryKey: ['сurrentRoundQuestion'],
    queryFn: getCurrentRoundQuestion,
    staleTime: 0,
    refetchOnWindowFocus: false,
  });

  const [question, setQuestion] = useState(null);
  const [answers, setAnswers] = useState([]);
  const [currentOption, setCurrentOption] = useState(1);

  useEffect(() => {
    if (data) {
      setQuestion(data.question);
      setAnswers(data.answers);
      setCurrentOption(data.current_option);
    }
  }, [data]);

  const mutation = useMutation({
    mutationFn: updateRoundOption,
    onSuccess: (returnedData) => {
      console.log('useMutation onSuccess returnedData', returnedData)
      // Предполагаем, что returnedData содержит correct_position
      const {
        round_option,
        round_option: {
          correct_position
        },
        next_option
      } = returnedData;
      console.log('useMutation onSuccess returnedData', round_option)

      // Добавляем новый элемент в массив answers на позицию correct_position
      setAnswers((prevAnswers) => {
        const updatedAnswers = [...prevAnswers];
        updatedAnswers.splice(correct_position - 1, 0, round_option); // Вставляем элемент на нужную позицию
        return updatedAnswers;
      });
      setCurrentOption(next_option);
    },
  });

  const onDragEnd = (result) => {
    if (!result.destination) return;

    const params = { round_option: { user_position: result.destination.index + 1 } }
    mutation.mutate({ id: result.draggableId, params });
  };

  // Обработка состояния загрузки и ошибки
  if (isLoading) return <div>Загрузка...</div>;
  if (isError) return <div>Ошибка загрузки данных</div>;

  return (
    <DragDropContext onDragEnd={onDragEnd}>
      <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
        {question ? (
          <>
            <h2>{question.text}</h2>
            <RoundAnswers items={answers} />
            <RoundOption item={currentOption} />
          </>
        ) : (
          <div>Загрузка вопроса...</div>
        )}
      </div>
    </DragDropContext>
  );
};

export default Round;
