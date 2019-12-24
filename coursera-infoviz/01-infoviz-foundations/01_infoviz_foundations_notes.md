## Week 1

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

#### Purposes of Visualization &mdash; visualization classes

Now, let's talk about purpose. What are the main purposes of visualization? Why do people use it or may want to use it? Okay, so there's one common characterization of information visualization purposes, and we have three main classes. 

* explanatory visualization
* exploratory visualization
* confirmatory visualization. 

Explanatory visualization means that the main purpose of the visualization is to explain something to somebody else. So the idea is that their is someone who has some message or some idea that needs to be **communicated visually through data visualization**. And this person needs to design a visualization that is appropriate for explanation.

The second one is exploratory. What does it mean? Well, it means that in this case, there is a person who needs to extract information out of data and doesn't really know what the content of this data is. _So the idea is that the main purpose of visualization, in this case, is to help the person answer questions and generate new hypotheses_. 

The last one, which is somewhat similar, is confirmatory. What does it mean? Well, _the difference, here, between confirmatory and exploratory is that the person who is using visualization here has some hypothesis or question in mind that needs to be checked out_. So I all ready have a hypothesis, but I want to check whether my hypothesis actually holds in the data. And I use visualization, for instance, some charts, to verify whether my hypothesis is correct or not.

One important thing to say is that the main purpose of explanatory visualization is to communicate something to somebody else. So there is always an audience of some sort. So this why we group this into a communication category.

Whereas, exploratory and confirmatory analysis, most of the time, are about analyzing data. So there is a person who wants to reach some objectives by analyzing data.

* explanatory visualization  ---- **COMMUNICATION**
* exploratory visualization  \
                              +-- **ANALYSIS**
* confirmatory visualization / 

Examples: "How Americans think About Global Warming in 6 charts".

Exploratory: Very often, the output of exploratory analysis, is the generation of new questions. This is typical of exploratory analysis. We start with some answers, and, sorry, we start with some questions, and what we produce is not only answers to these questions, but also new questions or new hypotheses. 

#### Why graphical representation?

Another important question is why use graphical representations? Well, there are a number of ways to answer this question. _And the first way is that humans are actually visual animals_. It is estimated that up to 30 percent of the cortex of the brain is devoted to vision, and we have two big pairs of eyes and we are incredibly good at extracting and processing formation that comes from our environment. So, humans are inherently visual animals, and we are very, very good at processing visual information. 

The second way to answer that, requires asking another question. And the question is, if not graphically what are other ways to communicate information? So here, I'm listing three main ways to communicate information: 

* verbally 
* numerically 
* graphically

Well, one thing that stands out when I'm trying to communicate information verbally is that _we are forced to process this information sequentially_. That's a big, big difference. 

Whereas, when we are observing a chart, we are actually _consuming and processing this information in a parallel fashion, all at once_. We don't need to go through it sequentially, necessarily. The same in principle is true also for the table, but the problem with the table is that there is not much to see, there is not much to perceive , we have to process numbers that don't match directly, visually to some quantities.

#### Problems with Summary Statistics

Statistics are summaries of information that is contained in the data so that we can communicate the most important information. So, that's a very useful communication tool because, by providing some few numbers some pure statistics, we can communicate important information that is contained in the data. The problem though with statistics is that they aggregate information and remove a lot of details.

#### Why use interaction?

What is the advantage of interacting with visual representations? Well, there are a number of advantages, but the most important one, probably, is that when people analyze data visually, they have a number of different questions. And not all questions can be answered by looking at one single visual representation. So, having a system that can change as we interact with it and helps us answer different questions that we may have is extremely useful. 

So, in general, interaction is very useful because it helps the user answer a multitude of questions that will be almost impossible to answer in one single chart. 

an interesting area of research in visualization is how to do visualization with other devices and other interaction modes. 

#### Assesssing the quality of a visualization

How do you assess the quality of a visualization? How do you know that one visualization is better than another? That's a very important question. So, isn't that subjective? I show visualization to some people and some people like A, whereas some other people like B. Isn't that just about what people like? People have different tastes. Well, not necessarily. So, the thing is that some visual representations are actually much better than others at communicating some information. So, if your goal is to communicate information to somebody else effectively, some visual representations are clearly better because they are easier to interpret, and easier and faster, and more accurate to read.

Designing effective visualizations requires two main steps. 

* The first one is knowing the design space. 

That's a problem I see all the time. When you are asked to design a visual representation to communicate some data, you typically come up with a first idea, a first design. But if you don't know enough of the design space, it's very hard for you to create alternatives. But _being able to create a certain number of alternatives is a crucial skills for visualization design_, because if you don't do that, if you don't know how to do that, it won't be possible for you to actually see different solutions and start assessing them. So, skill number one is being able to explore the design space effectively. 

* The second skill linked to this one is being able to actually compare the solutions in an effective way. _You have to be able to predict whether a given visual representation is actually going to be more effective than another. And how do you do that? There are many ways, but the most important skill is to understand how human perception works_. And in particular, how human perception of graphical representation works. 

So, the rest of the course is going to provide you with exactly these two main tools: knowing the design space, knowing what visual representations are available for a certain type of data and problems, and learning enough about human perception that you can start reasoning about whether and why a given visual representation may be more effective than another.

### READING

https://queue.acm.org/detail.cfm?id=1805128

## Week 2