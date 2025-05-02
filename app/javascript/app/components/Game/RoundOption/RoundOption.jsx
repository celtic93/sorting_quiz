import React from 'react';
import { Droppable, Draggable } from 'react-beautiful-dnd';
import DraggableItem from '../DraggableItem';

const RoundOption = ({ item }) => {
  return (
    <Droppable droppableId="droppable-insert">
      {(provided) => (
        <div
          ref={provided.innerRef}
          {...provided.droppableProps}
          style={{ width: '300px', background: '#f0f0f0', padding: '10px' }}
        >
          <h2>Итем для вставки</h2>
          <DraggableItem item={item} index={0} />
          {provided.placeholder}
        </div>
      )}
    </Droppable>
  );
};

export default RoundOption;
