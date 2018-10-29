https://goo.gl/5aZjBF
https://goo.gl/v7qM4Q

0:03
So let's go. I promised at the beginning of the section that we were going to play with ML. So let's go ahead and play with ML. What I'll do is that I'll click on this link which will take me to the TensorFlow playground. So, here we are in playground.tensorflow.org. And this is essentially the problem that we started off with. We have spam and not spam, dots representing emails. We have two inputs X1 and X2 which could be the length of the email and the presence of a word. It could be the tone of the email, the content of the email; some attribute of the e-mail. So, based on these attributes of individual emails we want to learn how to classify emails into spam and not spam. And let's say that this is basically what our space of inputs looks like. So we have our X1 points and we have our X2 points. X1, let's leave it there. X1 as you can see is anything less than zero is negative. So, all the orange indicates negative and all the blues indicate positive. X2 is negative below the x-axis and it's positive above the x-axis. So those are my X1s and X2. So if I were to take any any point, if I take that point for this point X1 is about zero and X2 is about two. So that's essentially that point. And what we want to I ask is given an X1 and X2 can it classify this well? And at this point X1 has been given a weight of negative -0.38 and weight X2 has been given a weight of 0.37. And those are arbitrary numbers. So we can refresh this and we can basically get a different set of weights; -0.34, 0.4 rate. Refresh that again and now we have a different starting point 0.42 and at this point there's 0.38, -0 whatever. So, we have different starting points and we can start from that starting point regardless of what it is and ask the gradient descent algorithm to take over and find us good X1s an X2s, good weights for X1 and X2 based on this dataset. So that's basically what I'm going to do when I hit the run button and overtime X1 and X2 are getting modified. And now with X1 as 0.35, the weight of X1 as 0.35 and the weight of X2 0.32, it turns out that this becomes a separation line. And now the training loss error; the last is the error, it's really low. And as we can see that line is a pretty good separation of the blue dots from the orange dots. So that's the process. You have your Xs and Ys, X1s and X2s and you want to find the weight to assign to X1 and the weight to assign to X2 in such a way that if X1 times W1 plus X2 times W2 is greater than zero, it is blue. And if it's less than zero it's orange. So in this case there is no bias. We're just assuming that the bias is zero and just tuning or just tweaking W1 and W2. Again, we've used a number of words intuitively. So pause for a moment and try to write down, in your own words, what you understand by each of these terms.
4:05
The weights are free parameters in a machine learning model. The weights are the things that you get to change so that your model captures your data, right? In our case, when we wanted to separate out spam from not spam, the weights were
4:26
the parameters that we could adjust, so that we could move this line so that it became a good separation of the blue dots from the orange dots.
4:37
What's a batch size?
4:39
The batch size is a number of points over which we try out the changes in weights. So if we were to look at this slide.
4:52
So when we start with an arbitrary value for weight, and then we increase a weight and we decrease a weight, and we evaluate the error, we calculate the error, we don't do this over the entire dataset, we do this on a few points. And those few points that we do this on, is called a batch size.
5:14
The epoch, on the other hand, is one traversal through the entire training dataset. So an epoch is on traversal through the dataset. It consists of going through multiple batches. In our example, if we said we had 100,000 samples was our training dataset, and each batch was 100, then an epoch consists of 1,000 batches or 1,000 steps. So that's another word that's often used for one step is one tweak of the weights.
5:49
Gradient descent is this process by which we go towards the direction in which the error gets lower. We change the weights so that the error gets lower.
6:03
Evaluation is the step that we carry out every once in a while, where we say, okay, now that we've tweak this, let's go back and figure out how well our model does over the entire dataset. And we do this so that we can decide whether or not to stop the training. And training itself is this entire process, is this process of taking your data, dividing it into batches, carrying our gradient descent, and every few times in their epoch, every few epochs, doing an evaluation and deciding whether to stop or not.
6:47
So that's great if we're talking about numbers with x's and y's, those are numbers, and we've just gone ahead and added x's and y's. And we said let's find a weight for x1, and let's find a weight for x2. But how about images? If we have an image that looks like this and I want to identify what digit a particular image is in. What are my x's and what are my y's? What's my x1, x2 look like?
7:15
Well, What we do is that we take an image and let's say this is a 28 by 28 gray scale image. Every one of those pixels is a number between 0 and 1. So if you have a gray scale image that's 0 to 255, divide it by 255. Say you got a number between 0 and 1. So we basically have axis and x1 is the first pixel, x2 is the second pixel of the first draw. x3 is the third pixel of the first draw, and so on. Go through all of the rows of the image, and so now because we had a 28 by 28 image, we have 784 inputs. Those are our x's.
7:59
And what we need to do is to find a weight for each of these inputs. So the weight for the first pixel, weight for the second pixel, weight for the third pixel. And then we check if it's greater than bias, and that essentially becomes our neuron. So our neuron here, the input to the neuron is every pixel. So we take our image, and we break them down into pixels. And if the value of a pixel, because it's a gray scale image, it's just one number, the value of the pixel becomes the input into the neuron.
8:35
Now, the other complication here, is that with SPAM and not SPAM we only had one decision to make, is it SPAM or not SPAM? On the other hand, if you're trying to identify digits, the number of classes is actually ten, zero to nine. So zero, one, two, three etc. So, what we have are actually ten outputs, all right?
9:03
So we combine x1 times w1, x2 times w2, x3 times w3, but all of those for output number 1, so that's why it's w1,3. So that's the weight for output one. So these tells you whether this image is a zero or not. The next set of weights, is for w1 times x1, and w2 times x2, and x3 times x3. But in this case for output number two, so that's why it's w2,1 and w2,2 and w2.3. And these tell you whether this is the digit one and so on. So we have the output for digit zero, the output for digit one, the output for digit three etc, all of these recall that when we said when we do classification we get a number between zero and one and we interpret that as a probability. So what we get is a probability that this is a zero, probability that this is a one, probability that this is a nine. However, we know that sum of all these probabilities should be one. And so we can impose this by using what's called a softmax, so we essentially take all of those input probabilities, and we normalize them in such a way that the total probability of all of those outputs is one, and that tells us what is the most likely, possibility. So, for example, for this image we may have seven with pretty much a probability of one and no other alternatives. Whereas for this image, for the third image, you may have for, thing, most likely it is a 4. 90% probability that it's a four, but a wee bit, a small probability, maybe about 10% that this is a nice with a top cut off.
11:10
On the other hand, once there's a squiggly at the end, it turns out that nobody writes nines with squigglies. Whereas, the way you write a four is that you start with the top left and then you end with the top, bottom right, and so lots of times your pen slips a little bit and there's a squiggle at the end. And that makes it almost impossible that this is a nine with the top cut off and therefore this is a 4. Now, this is the reasoning that I'm providing, that neural network obviously doesn't know any of this reasoning, it just knows that if there's a black at that point, it's very unlikely to be a nine. And so the weight for the output of nine for a Pixel at the point of the squiggly is low. Similarly, right so you can do, so you can look at any of these images and you will get one probability for all of them and pretty much what you will do is that you will take the marks of all of those. So this is how you deal with a multi category problem, it's exactly the same in terms of the newer network itself, in terms of gradient descent, it's just that you have ten outputs in the penultimate layer. And the very last layer is a softmax so that you end up with something that the total probability is one, and you can look at
12:34
the algoMax of that vector to figure out which output is most likely.
12:41
So let's go ahead and continue our playing a little bit. So where we take a slightly more complex example, say if we were to look at this example. Can we use a single line to separate these?
12:58
Well, it doesn't look very possible, right? There's no way to draw one line that can separate the blue dots from the orange dots. So let's verify that intuition.