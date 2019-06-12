<?php
echo "--------------------------------------------------------------------------------------\n";
echo "----------------------------------- THE ----------------------------------------------\n";
echo "-------------------------------- GUESSING --------------------------------------------\n";
echo "---------------------------------- GAME ----------------------------------------------\n";
echo "--------------------------------------------------------------------------------------\n";
echo "--------------------------------------------------------------------------------------\n";
echo "-------------- Welcome Guest, very pleased to be playing with you! -------------------\n";
echo "Please tell me your name";


//Collect user input
$line;
if (PHP_OS == 'WINNT') {
  echo '$ ';
  $line = stream_get_line(STDIN, 1024, PHP_EOL);
} else {
  $line = readline('$ ');
}
// Generate the random number
$rand=rand(0,20);

//inform the user that the number has been generate the guessingn can start
echo "Hello $line,\n I have generated a random number between 0 and 20.\n";
echo "You have six (6) attempts to guess this number.\n So lets do it.\n";
echo "-------------------------------- Good luck!!!!!!!!!!!!!!!--------------------------------\n";

//declare variables
$attempt = 0;
$count  = 1;
$guessed = false;

//start guessing
do{
	echo "Enter attempt $count ";
	if (PHP_OS == 'WINNT') {
		echo '$ ';
		$input = stream_get_line(STDIN, 1024, PHP_EOL);
	} else {
		$input = readline('$ ');
	}
	$input = intval($input);
	$guessed = Guess($input, $rand);
	if($attempt == 5){
		echo "---------------- SOOOOOOOOOO Bad, you could not guess right -------------------------\n";
		exit("------------------------------ PROGRAM EXITED ---------------------------------------\n");
	}
	$count++; 
	$attempt++;
}while(!$guessed && ($attempt < 6));
	

	
/**
*A function to do actual checking of the user input with the randomly generated number between 0 and 20.
*@param integer guessNummber the input of the user
*@param integer randomNummber the randomly generated number
*
*@return boolean true/false dependent on the condition
*/
function Guess($guessNummber, $randomNummber) {
	if($guessNummber == $randomNummber){
		echo "-------------- Congratulations! Congratulations! Congratulations!  -------------------\n";
		return true;
	}elseif($guessNummber > $randomNummber){
		echo "-------------- You guessed too high -------------------\n";
		return false;	
	}elseif($guessNummber < $randomNummber){
		echo "-------------- You guessed too low -------------------\n";
		return false;			
	}	
}

?>