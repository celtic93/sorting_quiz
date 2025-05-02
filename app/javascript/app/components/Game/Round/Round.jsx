import React, { useState, useEffect } from 'react';
import { DragDropContext } from 'react-beautiful-dnd';
import { useQuery } from '@tanstack/react-query';
import { getCurrentRoundQuestion } from '../../../api/api';
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

  const onDragEnd = (result) => {
    if (!result.destination) return;

    const newAnswers = Array.from(answers);
    const [movedItem] = newAnswers.splice(result.source.index, 1);
    newAnswers.splice(result.destination.index, 0, movedItem);
    setAnswers(newAnswers);
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
