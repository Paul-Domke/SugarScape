SugarGrid myGrid;

void setup(){
  size(1000,800);

  myGrid = new SugarGrid(30,40,20, new SeasonalGrowbackRule(3, 0, 100, 20, 50*40));

  myGrid.display();
  
  frameRate(2);
}

void draw(){
  myGrid.update();
  background(255);
  myGrid.display();
}

/*Make a visualization of the SugarScape's social network. Be creative. Here's an example:

Plot each agent as a 10x10 pixel square. Arrange the agents in a large circle.
Plot a line connecting two agents if they are connected in the social network at present.
Color each agent based on the amount of sugar it has.
Is there a pattern relating how much sugar an agent has, and who it is connected to?
Another example:

Display the sugar scape as normal, with a very slow frame rate. 
When an agent is clicked on, color it red.
When another agent is clicked on, color it blue.
Then compute the path from the first agent to the second agent, if it exists. Color the intermediary agents a mix of blue and red based on 
whether they are closer to the start or to the end. Draw lines connecting each agent in the path. */