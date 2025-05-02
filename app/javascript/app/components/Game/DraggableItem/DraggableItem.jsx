import React from 'react';
import { Draggable } from 'react-beautiful-dnd';

const DraggableItem = ({ item, index }) => {
  return (
    <Draggable key={item.id} draggableId={item.id.toString()} index={index}>
      {(provided) => (
        <div
          ref={provided.innerRef}
          {...provided.draggableProps}
          {...provided.dragHandleProps}
          style={{
            ...provided.draggableProps.style,
            padding: '10px',
            margin: '5px',
            background: '#fff',
            border: '1px solid #ccc',
          }}
        >
          {item.text}
        </div>
      )}
    </Draggable>
  );
};

export default DraggableItem;
