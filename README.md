<div class="container">
<div id="challenge" class="row">
<div class="col-sm-8">
<div class="row">
<div class="col-sm-12">
<div class="tab-content">
<div id="body" class="tab-pane fade in active">

We'll now add a back-end to our JavaScript racer game using a simple Sinatra app. The game still runs in a single browser instance, i.e., two players don't play each other across different browsers, but rather on a single browser.

The flow goes like this:
<ol>
	<li>Two people get on a computer and visit the application</li>
	<li>The application prompts each player to enter their name</li>
	<li>The players fill out the form and this creates a new game</li>
	<li>The new game starts, and each player smashes their respective key until one of them wins</li>
	<li>After one of them wins, the winning player and amount of time it took to win is sent to the server and the game is recorded as being "done"</li>
	<li>The players can choose to start another game using their same initials, or restart using different initials</li>
	<li>After a game is finished the players are given a unique URL at which they can view the results of that particular game</li>
</ol>
<h2>Objectives</h2>
<h3>Models</h3>
You should have two core models: <code>Player</code> and <code>Game</code>. A player can be in many games and a game can have multiple players. For now it's "just two," which can be hard-coded into the game creation form.

Player names should be unique. If someone chooses the game initials/name/etc. as someone else they'll be playing the same "player." This means there should be a uniqueness constraint at both the database level by using a <code>UNIQUE INDEX</code> and a <a href="http://guides.rubyonrails.org/active_record_validations.html#uniqueness">uniqueness constraint</a> on the <code>Player</code> model.

You can make a UNIQUE INDEX by adding <code>:unique =&gt; true</code> to your <code>add_index</code> call. See the <a href="http://apidock.com/rails/v3.2.8/ActiveRecord/ConnectionAdapters/SchemaStatements/add_index">add_index documentation</a>.

It's important to enforce this at both the ActiveRecord and database level. Your database is the only thing that can truly, 100% guarantee uniqueness, but an error at the database level is both very expensive and hard for user-land to interactive with.

You should use a <a href="http://guides.rubyonrails.org/active_record_validations.html#custom-methods">custom ActiveRecord validation</a> to ensure that every game has exactly two players. This constraint is hard to model on the database level, so we leave it to ActiveRecord.
<h3>Routes</h3>
Remember, you need routes which correspond to:
<ol>
	<li>Starting / creating a new game</li>
	<li>Playing a new game</li>
	<li>Viewing the results of an old game</li>
</ol>
<h3>Views and Flow</h3>
Implement the flow from the description above and submit your Sinatra app! If it's a GitHub repository, submit it as a gist with a link to your repository.

</div>
</div>
</div>
</div>
</div>
</div>
</div>
&nbsp;
