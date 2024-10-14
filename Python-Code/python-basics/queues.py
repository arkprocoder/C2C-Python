# FIFO=Queue

from collections import deque

queue=deque()

queue.append('a')
queue.append('b')
queue.append('c')
queue.append('d')
queue.append('e')

front=queue[0]
print("front element is ",front)
rear=queue[-1]
print("rear element is ",rear)


deque_element=queue.popleft()
print(deque_element ," has passed")
deque_element=queue.popleft()
print(deque_element ," has passed")
deque_element=queue.popleft()
print(deque_element ," has passed")
deque_element=queue.popleft()
print(deque_element ," has passed")
deque_element=queue.popleft()
print(deque_element ," has passed")
deque_element=queue.popleft()
print(deque_element ," has passed")


if not queue:
    print("Queue is empty")
else:
    print(queue)

