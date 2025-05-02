import React from 'react';
import { Droppable, Draggable } from 'react-beautiful-dnd';
import DraggableItem from '../DraggableItem';

const RoundAnswers = ({ items, onDragEnd }) => {
  return (
    <Droppable droppableId="droppable-items">
      {(provided) => (
        <div
          ref={provided.innerRef}
          {...provided.droppableProps}
          style={{ width: '300px', background: '#f0f0f0', padding: '10px', marginBottom: '20px' }}
        >
          <h2>Список Итемов</h2>
          {items.map((item, index) => (
            <DraggableItem key={item.id} item={item} index={index} />
          ))}
          <h2>Список Итемов</h2>
          {provided.placeholder}
        </div>
      )}
    </Droppable>
  );
};

export default RoundAnswers;
