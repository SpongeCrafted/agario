var player = new Circle(10);

function start(){
    setUpGame();
}

function setUpGame(){
    
    // sets scene
    setBackground();
    
    setPlayer();
    
    keyDownMethod(playerMove);
    
    setTimer(checkWalls, 10);
}

function setPlayer(){
    player.setPosition (getWidth()/2 , getHeight()/2);
    player.setColor(Color.red);
    add(player);
}


function setBackground(){
    var background = new Rectangle(getWidth() , getHeight());
    background.setColor(Color.black);
    background.setPosition(0,0);
    add(background);
}

var A = 0;
function playerMove(e){
    if(e.keyCode == Keyboard.letter("A")){
        println(A);
        timerA();
        A++;
    }
    if(e.keyCode == Keyboard.letter("W")){
        println(A);
        timerB();
        A++;
    }
    if(e.keyCode == Keyboard.letter("D")){
        timerC();
        println(A);
        A++;
    }
    if(e.keyCode == Keyboard.letter("S")){
        timerD();
        println(A);
        A++;
    }
}

// These functions are for the Start and Stop timers.
function timerA(){
    stopTimer(playerActiveW);
    stopTimer(playerActiveD);
    stopTimer(playerActiveS);
    setTimer(playerActiveA, 10);
}

function timerB(){
    stopTimer(playerActiveD);
    stopTimer(playerActiveS);
    stopTimer(playerActiveA);
    setTimer(playerActiveW, 10);
}

function timerC(){
    stopTimer(playerActiveW);
    stopTimer(playerActiveA);
    stopTimer(playerActiveS);
    setTimer(playerActiveD, 10);
}

function timerD(){
    setTimer(playerActiveS, 10);
    stopTimer(playerActiveA);
    stopTimer(playerActiveW);
    stopTimer(playerActiveD);
}
//These functions are for a constant move without having to hold down a button like in the actual snake.io
function playerActiveA(){
    player.move(-2 , 0);

}

function playerActiveW(){
    player.move(0, -2);
}

function playerActiveD(){
    player.move(2, 0);
}

function playerActiveS(){
    player.move(0,2);
}

function checkWalls(){
    //right wall
	if(player.getX() + player.getRadius() > getWidth()){
		player.move(-3,0);
	}
	//left wall
	if(player.getX() - player.getRadius() < 0){
		player.move(3,0);
	}
	
	//bottom wall
	if(player.getY() + player.getRadius() > getHeight()){
	    player.move(0,-3);
	}
	//top wall
	if(player.getY() - player.getRadius() < 0){
	    player.move(0,3);
	}
}
