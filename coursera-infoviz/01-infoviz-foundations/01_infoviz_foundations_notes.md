Okay, the main goal of this specialization is to teach you how to design, evaluate, and develop interactive visualizations to help people generate insights and then communicate these insights to other people as effectively as possible.

So, what all these areas have in common when we talk about the use of visualization is the basic idea of transforming data into something that enhances the comprehension of what is described by the data.

There are many definitions of information visualization out there. The one that I'm providing here comes from one of the most popular books explaining what information visualization is and it's called Readings in Information Visualization Using Vision to Think. And the definition is the following, the use of computer-supported, interactive, visual representations of abstract data to amplify cognition.

* computer based
* graphical/visual representations
* abstract data
* interactive
* amplify cognition

#### Computer based, Graphical representations

Let's take a look at what the key concepts of the definitions are. The first one is that it's computer based. So, this means that we are concerned with visualization methods that transform data into a visual representation using computers. The second one is that we are using visual representations. The third one is that we are mostly concerned with visualizing abstract data, and I'm going to elaborate on that a little longer later on. The next one is that it's interactive, and the example that I've just shown hopefully gives you a sense of what interactive means, it means that the user can interact with the visual representation. The last one is that the main goal is to amplify cognition.

#### Abstract Data

The next one is a little trickier. Abstract Data. What does it mean? Well, first of all it means that we are talking about representing visually data that doesn't necessarily have a very natural or obvious visual representation. One way to think about it is to think about the difference between visualizing physical data or physical objects or phenomena versus data that is not necessarily physical.

So, this is when one of the major issues in information visualization. In most of the cases, there is no obvious visual representation and you as a visualization designer have the very hard task to decide what's the best representation for something that is abstract.

#### Interactivity

The next concept is the idea that the visual representation is interactive. Users can interact with the visual representation by interacting with a computer.

More specifically, the idea here is that users can change what is visualized, but also how things are visualized.

#### Amplifying cognition

So what does it mean for a tool to amplify cognition? We can define this in many different ways. One way I like to describe this is that using a tool to amplify cognition means to solve problems better.

So amplify cognition means producing tool that help people think better.

So a concept related to this one is the idea of **cognitive artifact**. What is a cognitive artifact? It's a tool that humans have built to help humans think better.  It makes it easier to think about the problem and solve the problem.

And this way, you don't have to keep all the information in your mind as you're trying to solve this problem. That's a very important aspect. It shows you that in order to solve a problem, some elements that you should actually store in memory, you're storing them in the world.

So that's a very powerful concept. Let me state this again. So in order to solve a problem, you are using some cognitive artifacts that are not in your mind. They are in the world, to record information so that you can access this information when it's needed, but you don't have to retain it in your mind all the time. That's an extremely powerful concept. And it's related to another concept that is called **distributed cognition**. What does distributed cognition mean? It means that our cognitive system is not exclusively made of our brain, our mind, and our sensors. It's also made of the artifacts and the environment that we have around us and we use to store and manipulate information. So this concept is extremely powerful and it's very important in visualization. _Because visualization is a way for us to store information out of our mind and make it accessible through our eyes and also through manipulation with interactive systems_.

##### Game of 15 x Tic Tac Toe : problems isomorph

In the Game of 15, the pieces for the game are the nine digits, one two three four five six seven eight and nine. Each player takes a digit in turn and once a digit is taken, it can't be used by the other player. The first player to get three digits that sum to 15, wins.

Well, players alternately plays a X or the symbol O in one of nine spaces arranged in a rectangular array like the one that you see in the image. Once a space has been taken, it cannot be changed by either player. The first player to get three symbols in a straight line, wins.

So, you may have noticed that the second game is easier to play than the first game. Is even easier to describe, right? _So, it turns out that these two games are exactly the same and this concept is called problem Isomorph, an idea that has been developed by Nobel Prize winner, Herbert Simon_. If you look at this array, this is the array:

| 4 | 8 | 2 |
| 3 | 5 | 7 |
| 8 | 1 | 6 |

that I've shown to you to describe the tic-tac-toe game and I put the numbers that we use in the Game of 15 in the cells of this array. Now, if you think about it, playing tic-tac-toe and the Game of 15 is exactly the same thing. Because every time you are able to fill out a row, a column or a diagonal, the sum of the numbers is 15. But again, playing the game in tic-tac-toe is much easier than in the Game of 15. Why is that? Once again, because in the second example in the second game, _we have some visual representation that helps us store some of the information in the world rather than having all this information in our mind. Ultimately, this makes reasoning about the problem much easier._

#### Why visualize data?

Why visualize data at all? Why do we do that? 

To answer this question, I want to go back to the diagram that I've shown you at the beginning. Let me go to the diagram again. 

So we have data. **Data** is **encoded visually** using a computer to create a **visual representation**. This visual representation is **perceived** by one or more humans. And these users can **interact** with the data and with the visualization, to reason about the data and the problem described by the data. 

Now, I want to add a couple of elements to this diagram that help us explain and understand why we visualize data, why is it desirable. The first element is the idea that _data is a description of some phenomenon of interest_, right? Why do we use data? Why do we visualize data? Not because we are interested in the data itself, we do it because it's an abstract representation of some reality or some phenomena we are interested in. That's very important. 

So the ultimate interest is using data as a way to understand some phenomena. That's very important. Connected to that, is _the idea that the user who is using the visualization and interacting with the visualization has some goals that refer to these phenomena. And also has some mental models of what this phenomenon is about and how it works_. So in general, people who are using visualization, come with some pre-existing knowledge and some goal related to better understanding some phenomena. _And visualization systems use data, visual representations, and interaction to help people understand some phenomena better_.