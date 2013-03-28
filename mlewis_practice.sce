/*
This experiment is a replication from the article
"Errors Are Aversive: Defensive Motivation and the Error-Related
Negativity" by Greg Hajcak and Dan Foti (2008).
doi: 10.1111/j.1467-9280.2008.02053.x

I'm running it as part of the Reproducibility Project, which you
can learn more about at http://openscienceframework.org/.
*/

# ---------- begin header ---------- #

scenario = "mlewis_practice.sce";
scenario_type = trials;
active_buttons = 2;		#specifies how many buttons can be used
button_codes = 1,2;	#specifies button codes
default_background_color = 0,0,0; #black
default_text_color = 255,255,255; #white
default_font = "Palatino Linotype";
default_font_size = 36;
write_codes = true;
default_trial_type = first_response;


# ---------- end header ---------- #
begin;

ellipse_graphic {
	ellipse_height = 150;
	ellipse_width = 150;
	height = 100;
	width = 100;
	color = 255, 255, 255;
} flash;

picture {
			text {
				caption = "+";
				font_size = 48;
			};
		x=0; y=0; # centers text
		} default; # sets fixation cross as default image
	
wavefile { filename = "startle3amplified.wav"; } startle; #name of stimulus is "startle"
bitmap { filename = "LC.jpg"; } bmLC; #name of stimulus is "LC" for "left(-facing center) congruent"
bitmap { filename = "LI.jpg"; } bmLI; #name of stimulus is "LI" for "left(-facing center) incongruent"
bitmap { filename = "RC.jpg"; } bmRC; #name of stimulus is "RC" for "right(-facing center) congruent"
bitmap { filename = "RI.jpg"; } bmRI; #name of stimulus is "RI" for "right(-facing center) incongruent"

picture {
    bitmap bmLC;
    x = 0; y = 0;
} LC;

picture {
    bitmap bmLI;
    x = 0; y = 0;
} LI;

picture {
    bitmap bmRC;
    x = 0; y = 0;
} RC;

picture {
    bitmap bmRI;
    x = 0; y = 0;
} RI;

trial {
	trial_type = first_response;
	trial_duration = 800;
		picture {
			bitmap bmLC;
			x = 0; y = 0;
		ellipse_graphic flash;
		x = 920; y = -500;
	};
   time = 0;
	duration = 200;
	target_button = 1;
	code = 10;
	port_code = 10;
} trial_LC;			# name is "trial_LC" and means center arrow left, congruent w/flankers

trial {
	trial_type = first_response;
	trial_duration = 800;
		picture {
			bitmap bmRC;
			x = 0; y = 0;
		ellipse_graphic flash;
		x = 920; y = -500;
	};
   time = 0;
	duration = 200;
	target_button = 2;
	code = 11;
	port_code = 11;
} trial_RC;			# name is "trial_RC" and means center arrow right, congruent w/flankers

trial {
	trial_type = first_response;
	trial_duration = 800;
		picture {
			bitmap bmLI;
			x = 0; y = 0;
		ellipse_graphic flash;
		x = 920; y = -500;
	};
   time = 0;
	duration = 200;
	target_button = 1;
	code = 20;
	port_code = 20;
} trial_LI;			# name is "trial_LI" and means center arrow left, incongruent w/flankers

trial {
	trial_type = first_response;
	trial_duration = 800;
		picture {
			bitmap bmRI;
			x = 0; y = 0;
		ellipse_graphic flash;
		x = 920; y = -500;
	};
   time = 0;
	duration = 200;
	target_button = 2;
	code = 21;
	port_code = 21;
} trial_RI;			# name is "trial_RI" and means center arrow right, incongruent w/flankers

trial {
	trial_duration = 1; #this is set to a random integer in PCL below
		picture {
			text {
				caption = "+";
				font_size = 48;
			};
		x=0; y=0; # centers text
		};
	code = 100;
	port_code = 100;
} trial_ISI; #name is "trial_ISI"

trial {
	trial_duration = 1; #this is set to a random integer in PCL below
		picture {
			text {
				caption = "+";
				font_size = 48;
			};
		x=0; y=0; # centers text
		};
	code = 101;
	port_code = 101;
} short_ISI; #name is "short_ISI"
	
trial {
	trial_duration = 500;
	stimulus_event {
		sound {
			wavefile startle;
		};
		deltat = 300;
		duration = 50;
	};
		nothing {}; # delays code corresponding to auditory stimulus to be more accurate; may need to be readjusted
			deltat = 20;
			code = 153;
			port_code = 153;
	} trial_auditory_random;	#name is "trial_auditory_unpredictable" and is a white noise to be played at 108 db

trial {
	trial_duration = 3000;
	picture {
		text {
			caption = "Please try to be more accurate.";
		};
		x=0; y=0; # centers text
	};
} trial_accurate;
	
trial {
	trial_duration = 3000;
	picture {
		text {
			caption = "Please try to respond faster.";
		};
		x=0; y=0; # centers text
	};
} trial_faster;

trial {
	trial_duration = 3000;
	picture {
		text {
			caption = "You're doing a great job.";
		};
		x=0; y=0; # centers text
	};
} trial_greatjob;

# -------------PCL -------------#

begin_pcl;

loop #block loop

	int block_hits = 0;

	int j = 0;

until j == 8 #number of blocks

begin

	array <int> porkchops[30] = {1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4};
	porkchops.shuffle();

	loop #trial loop

		int i = 1;
		int ISI_times = 0; # variable is an integer for duration of ISI without startle
		int short_time = 0; # variable is an integer for duration of ISI following startle

		bool current = true;
		bool last = true;

	until i > 30

	begin
		ISI_times = random(500,1000);
		trial_ISI.set_duration(ISI_times);
		
		if (porkchops[i] == 1) then
			trial_LC.present();
		elseif (porkchops[i] == 2) then
			trial_RC.present();
		elseif (porkchops[i] == 3) then
			trial_LI.present();
		elseif (porkchops[i] == 4) then
			trial_RI.present();
		end; #ends if/elseif regarding stimulus presentation
		if (response_manager.hits() == 1) then
			current = true;
		else current = false;
		end; /*ends if/else specifying state that determines probability of
				playing white noise, where if current = true it remains at 4%
				and if current = false probability goes to 50%*/
		block_hits = block_hits + response_manager.hits();
		#this is how I keep track of accuracy within a trial to guide feedback at the end of the block
		int auditory = random(0,9);
			if auditory == 0 then
				trial_auditory_random.present();
				short_ISI.present(); # this ISI only ranges from 150-650ms because startle already took 350ms 
			else trial_ISI.present();
		end; # in the practice run, the noise is generally played 10% of the time irrespective of performance
		i = i+1;
		
	end; #ends trial loop
	
	if block_hits < 22 then
		trial_accurate.present();
		trial_ISI.present();
	elseif block_hits > 27 then
		trial_faster.present();
		trial_ISI.present();
	else
		trial_greatjob.present();
		trial_ISI.present();
	end;

	j = j+1; # increments count of block

end; #ends block loop