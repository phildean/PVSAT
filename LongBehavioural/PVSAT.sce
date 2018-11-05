scenario = "PVSAT_25/04/08";
pcl_file = "PVSAT_Main.pcl";
response_matching = simple_matching;
default_font_size = 48;
default_font = "Arial";
default_background_color = 0,0,0; 
default_text_color = 255,255,255;
active_buttons = 4;
button_codes = 1,2,3,4;
write_codes = true;
pulse_width = 20;
stimulus_properties = trial_code, string, number, string, is_target, string;
event_code_delimiter = ",";

begin;

#PVSAT Introduction Screens
text{caption = "Paced Serial Visual Addition Task\n\nIn each trial you will be presented with a series of numbers\nYour task is to add the number currently presented with the\nnumber presented immediately prior to it.\n\nIf the sum equals a previously specified amount,\nthen you are asked to press the target button,\notherwise press the non-target button\n\nThe numbers will be presented at either\n1, 1.5, 2 or 2.5 second intervals"; font_size =25; } IntroScreen;
text{caption = "Paced Serial Visual Addition Task\n\nFor example if the target sum was 10, then a sequence:\n\n[5 - 7]\n\nwhen added together equals 12,\nthis is not the target sum,\nso the non-target button is the correct response\n\nHowever as the sequence continues:\n\n5 - [7 - 3]\n\nthen the next addition equals 10,\nso the target button is the correct response."; font_size =25; } IntroScreen2;

#PVSAT Block Descriptions
text{caption = "In this block numbers will be presented every\n\n1 Second\n\nYou will be required to press the target button\nwhen the sum is"; font_size = 25;}BeginBlock_1_Second; 
text{caption = "In this block numbers will be presented every\n\n1.5 Seconds\n\nYou will be required to press the target button\nwhen the sum is"; font_size = 25;}BeginBlock_1_5_Second;
text{caption = "In this block numbers will be presented every\n\n2 Seconds\n\nYou will be required to press the target button\nwhen the sum is"; font_size = 25;}BeginBlock_2_Second;
text{caption = "In this block numbers will be presented every\n\n2.5 Seconds\n\nYou will be required to press the target button\nwhen the sum is"; font_size = 25;}BeginBlock_2_5_Second;
text{caption = "<num>"; font_size = 30;}Target_Sum;
text{caption = "Press a button to continue"; font_size = 25;}Press_Button;
text{caption = "A non-target response is required\nfor the first number presented"; font_size = 25;} First_Number;

#General Text for Running Experiment
text{caption = "Please keep your eyes fixed\non the centre of the screen"; font_size = 25;}Pretrial;

text{caption = "!! Please take a break !!\nExperiment has been paused by the experimenter"; font_size = 25;}Pause;    # T 50
text{caption = "When you are ready to continue press a button"; font_size = 25; }Continue;     

text{caption = "End of Block:"; font_size = 25;}Block;               # T 60
text{caption = "<num>"; font_size = 25;}BlockNumber;                 # The <num> is overwritten by PCL
text{caption = "Percent correct:"; font_size = 25;}PercentText;
text{caption = "<num>"; font_size = 25;}PercentCorrect;              # The <num> is overwritten by PCL


# Resume trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
    
     picture {
            text Continue;
            x = 0; y = 0;
      };
     code = "Cont";   
     
}ResumeTrial; 

# Pause trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
     
     picture {
            text Pause;
            x = 0; y = 0;
     };
     deltat = 25;
     code = "Pause";   
     port_code = 50;
     
}PauseTrial;

# End of block trial
trial{                 
     trial_duration = forever;
     trial_type = first_response;
     all_responses = true;
     
     picture {
            text Block;  
            x = 0; y = 100; 
            text BlockNumber;
            x = 0; y = 50;   
            text PercentText;
            x = 0; y = 0;
            text PercentCorrect;
            x = 0; y = -50;
            text Continue;
            x = 0; y = -100;
     };
     deltat = 25;
     code = "EndBl"; 
     port_code = 60;  
     
}EndTrial; 

#Introduction Code 

TEMPLATE "IntroScreen.tem" {   
   stext          		scode             		IntroName;
   IntroScreen    		"Intro Screen"    		Intro1;
	IntroScreen2			"Intro Screen 2"			Intro2;
   Pretrial       		"Pretrial"        		Intro3;
};

TEMPLATE "BeginBlock.tem" {   
   sbeginblock          		scodebeginblock			eventbeginblock;
   BeginBlock_1_Second    		"Intro 1 PVSAT"    		Block1;
	BeginBlock_1_5_Second		"Intro 1.5 PVSAT"			Block1_5;
   BeginBlock_2_Second     	"Intro 2 PVSAT"        	Block2;
   BeginBlock_2_5_Second		"Intro 2.5 PVSAT"			Block2_5;
};

array {
	text { caption = "1"; description = "1"; } one;
	text { caption = "2"; description = "2"; };
	text { caption = "3"; description = "3"; };
	text { caption = "4"; description = "4"; };
	text { caption = "5"; description = "5"; };
	text { caption = "6"; description = "6"; };
	text { caption = "7"; description = "7"; };
	text { caption = "8"; description = "8"; };
	text { caption = "9"; description = "9"; };
} numbers;

array {
	text { caption = "1"; description = "1"; } no_nine;
	text { caption = "2"; description = "2"; };
	text { caption = "3"; description = "3"; };
	text { caption = "4"; description = "4"; };
	text { caption = "5"; description = "5"; };
	text { caption = "6"; description = "6"; };
	text { caption = "7"; description = "7"; };
	text { caption = "8"; description = "8"; };
} numbers_no_nine;

array {
	text { caption = "2"; description = "2"; }no_one;
	text { caption = "3"; description = "3"; };
	text { caption = "4"; description = "4"; };
	text { caption = "5"; description = "5"; };
	text { caption = "6"; description = "6"; };
	text { caption = "7"; description = "7"; };
	text { caption = "8"; description = "8"; };
	text { caption = "9"; description = "9"; };
} numbers_no_one;


TEMPLATE "Trial.tem" {   
	strialduration		stext			pic	          					trialportcode			event             					main_trial;						
	1000					no_nine		PVSAT_1_pic_target_nonine		31							PVSAT_1_event_target_nonine		PVSAT_1_trial_target_nonine;		# 1 second:		target 9
	1000					one			PVSAT_1_pic_target				32							PVSAT_1_event_target					PVSAT_1_trial_target;				# 1 second:		target 10
	1000					no_one		PVSAT_1_pic_target_noone		33							PVSAT_1_event_target_noone			PVSAT_1_trial_target_noone;		# 1 second: 	target 11
	1500					no_nine		PVSAT_1_5_pic_target_nonine	34							PVSAT_1_5_event_target_nonine		PVSAT_1_5_trial_target_nonine;	# 1.5 second:	target 9
	1500					one			PVSAT_1_5_pic_target				35							PVSAT_1_5_event_target				PVSAT_1_5_trial_target;				# 1.5 second:	target 10
	1500					no_one		PVSAT_1_5_pic_target_noone		36							PVSAT_1_5_event_target_noone		PVSAT_1_5_trial_target_noone;		# 1.5 second:	target 11
	2000					no_nine		PVSAT_2_pic_target_nonine		37							PVSAT_2_event_target_nonine		PVSAT_2_trial_target_nonine;		# 2 second:		target 9
	2000					one			PVSAT_2_pic_target				38							PVSAT_2_event_target					PVSAT_2_trial_target;				# 2 second:		target 10
	2000					no_one		PVSAT_2_pic_target_noone		39							PVSAT_2_event_target_noone			PVSAT_2_trial_target_noone;		# 2 second:		target 11
	2500					no_nine		PVSAT_2_5_pic_target_nonine	40							PVSAT_2_5_event_target_nonine		PVSAT_2_5_trial_target_nonine;	# 2.5 second:	target 9
	2500					one			PVSAT_2_5_pic_target				41							PVSAT_2_5_event_target				PVSAT_2_5_trial_target;				# 2.5 second:	target 10
	2500					no_one		PVSAT_2_5_pic_target_noone		42							PVSAT_2_5_event_target_noone		PVSAT_2_5_trial_target_noone;		# 2.5 second:	target 11
};

TEMPLATE "Trial_NonTarget.tem" {
	strialduration		stext			pic	          					trialportcode			event             					main_trial;						
	1000					no_nine		PVSAT_1_pic_normal_nonine		11							PVSAT_1_event_normal_nonine		PVSAT_1_trial_normal_nonine; 		# 1 second:		target 9
	1000					one			PVSAT_1_pic_normal				12							PVSAT_1_event_normal					PVSAT_1_trial_normal;				# 1 second:		target 10
	1000					no_one		PVSAT_1_pic_normal_noone		13							PVSAT_1_event_normal_noone			PVSAT_1_trial_normal_noone;		# 1 second: 	target 11
	1500					no_nine		PVSAT_1_5_pic_normal_nonine	14							PVSAT_1_5_event_normal_nonine		PVSAT_1_5_trial_normal_nonine;	# 1.5 second:	target 9
	1500					one			PVSAT_1_5_pic_normal				15							PVSAT_1_5_event_normal				PVSAT_1_5_trial_normal;				# 1.5 second:	target 10
	1500					no_one		PVSAT_1_5_pic_normal_noone		16							PVSAT_1_5_event_normal_noone		PVSAT_1_5_trial_normal_noone;		# 1.5 second:	target 11
	2000					no_nine		PVSAT_2_pic_normal_nonine		17							PVSAT_2_event_normal_nonine		PVSAT_2_trial_normal_nonine;		# 2 second:		target 9
	2000					one			PVSAT_2_pic_normal				18							PVSAT_2_event_normal					PVSAT_2_trial_normal;				# 2 second:		target 10
	2000					no_one		PVSAT_2_pic_normal_noone		19							PVSAT_2_event_normal_noone			PVSAT_2_trial_normal_noone;		# 2 second:		target 11
	2500					no_nine		PVSAT_2_5_pic_normal_nonine	20							PVSAT_2_5_event_normal_nonine		PVSAT_2_5_trial_normal_nonine;	# 2.5 second:	target 9
	2500					one			PVSAT_2_5_pic_normal				21							PVSAT_2_5_event_normal				PVSAT_2_5_trial_normal;				# 2.5 second:	target 10
	2500					no_one		PVSAT_2_5_pic_normal_noone		22							PVSAT_2_5_event_normal_noone		PVSAT_2_5_trial_normal_noone;		# 2.5 second:	target 11
};