Mastermind
==========

<h1>What is Mastermind?</h1>

<p>
Mastermind is a two-player code-breaking game where one player makes a code (in this program it will be the human player) and another player guesses the code (in this program this will be the computer player). 

The code is made up of four colors and can include duplicates. There are six available colors from which to choose: red, green, orange, yellow, blue, purple.</p>


<h1>Example</h1>
Computer prompts you for code:

<code>Can I have your secret code?</code>

You input a 4 letter secret code using: r, g, o, y, b, p

<code>rogy</code>


Computer makes a guess until it has matched your secret code:

<code>This is round 1
My guess is rrrr

This is round 2
My guess is rooo

This is round 3
My guess is royy

This is round 4
My guess is royg

This is round 5
My guess is rogy

I did it! I am so smart.</code>

<h1>How to play the game</h1>

<ol class="directions">
<li>clone the repository</li>
<code>$ git clone git@github.com:sneakingrocky/Mastermind.git</code>

<li>cd into the directory</li><code>
$ cd Mastermind
$ ruby bin/mastermind</code>
</li>
</ol>



