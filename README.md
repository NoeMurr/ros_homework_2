# ROS homework 2 - Laboratorio Ciberfisico

## Assignment

>1.Creare un mondo Gazebo che replichi uno dei due
scenari seguenti:
>* una parte del dipartimento
>* una ricostruzione del circuito TurtleBot3 auto race

>2. Generare e salvare una mappa dello scenario creato al punto precedente utilizzando il robot Turtlebot3 virtuale.

>3. Salvare in un breve video i dati che vengono visualizzati tramite Rviz quando il robot viene inviato, con il comando 2D Nav Goal, in una posizione del mondo virtuale. Il video deve contenere i riferimenti all’autore/agli autori.

## Svolgimento

Abbiamo scelto di modellare l'aula M di Ca' Vignal 2.
Per la modellazione abbiamo usato il software [OpenSCAD](http://openscad.org), successivamente i modelli `stl` sono stati importati in [Gazebo](http://gazebosim.org) per realizzare il mondo dove poter eseguire la simulazione.
La mappa è stata realizzata utilizzando RViz e SLAM, navigando TurtleBot3 in modalità manuale.
Il video mostra la simulazione finale utilizzando RViz per far navigare il robot utilizzando la mappa creata.

## Setup
Clonare il repository ed eseguire `setup.sh`. Si presuppone l'esistenza del workspace `catkin_ws`.
```
cd ~/catkin_ws/src
git clone github.com/noemurr/ros_homework_2
cd ros_homework_2
./setup.sh
```

## Esecuzione
Per eseguire la simulazione con navigazione in modalità autonoma:
```
cd ~/catkin_ws/src/ros_homework_2
./launch.sh
```

## Video
[YouTube video](https://youtu.be/mjIRCgMNDJg)

## Autori

- **Noè Murr**: modellazione aula ed elementi, simulazione
- **Mirko Morati**: modellazione aula e placement degli oggetti, video editing
