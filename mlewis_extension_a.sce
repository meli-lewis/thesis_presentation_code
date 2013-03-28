/*
This experiment is a replication from the article
"Errors Are Aversive: Defensive Motivation and the Error-Related
Negativity" by Greg Hajcak and Dan Foti (2008).
doi: 10.1111/j.1467-9280.2008.02053.x

I'm running it as part of the Reproducibility Project, which you
can learn more about at http://openscienceframework.org/.
*/

# ---------- begin header ---------- #

scenario = "mlewis_extension_a.sce";
scenario_type = trials;
active_buttons = 2;		#specifies how many buttons can be used
button_codes = 3,4;	#specifies button codes
default_background_color = 0,0,0; #black
default_text_color = 255,255,255; #white
default_font = "Palatino Linotype";
default_font_size = 36;
write_codes = true;

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
	code = 30;
	port_code = 30;
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
	code = 31;
	port_code = 31;
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
	code = 40;
	port_code = 40;
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
	code = 41;
	port_code = 41;
} trial_RI;			# name is "trial_RI" and means center arrow right, incongruent w/flankers

trial {
	trial_duration = 455;
	stimulus_event {
		sound {
			wavefile startle;
		};
		deltat = 300;
		duration = 50;
	};
		nothing {};
			deltat = 20;
			code = 160;
			port_code = 160;
	} trial_auditory_error;	#name is "trial_auditory_error" and is a white noise to be played at 108 db following an error
	
trial {
	trial_duration = 350;
	stimulus_event {
		sound {
			wavefile startle;
		};
		deltat = 300;
		duration = 50;
	};
		nothing {};
			deltat = 20;
			code = 161;
			port_code = 161;
	} trial_auditory_predictable;	#name is "trial_auditory_predictable" and is a white noise to be played at 108 db
	
trial {
	trial_duration = 350;
	stimulus_event {
		sound {
			wavefile startle;
		};
		deltat = 300;
		duration = 50;
	};
		nothing {};
			deltat = 20;
			code = 162;
			port_code = 162;
	} trial_auditory_unpredictable;	#name is "trial_auditory_unpredictable" and is a white noise to be played at 108 db

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

trial {
	trial_duration = 500;
	picture {
		text {
			caption = "+2";
			font_size = 72;
		};
		x=0; y=0; # centers text
	};
	code = 221;
	port_code = 221;
} points_fast;

trial {
	trial_duration = 500;
	picture {
		text {
			caption = "+1";
			font_size = 72;
		};
		x=0; y=0; # centers text
	};
	code = 222;
	port_code = 222;
} points_slow;

trial {
	trial_duration = 500;
	picture {
		text {
			caption = "-1";
			font_size = 72;
		};
		x=0; y=0; # centers text
	};
	code = 223;
	port_code = 223;
} points_error;

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
		bool previous = true;
		bool fast = true;
		int reaction_time = 0;

	until i > 30

	begin
		ISI_times = random(500,1000);
		trial_ISI.set_duration(ISI_times);
		
		short_time = random(150,650);
		short_ISI.set_duration(short_time);

		
		if (porkchops[i] == 1) then
			trial_LC.present();
		elseif (porkchops[i] == 2) then
			trial_RC.present();
		elseif (porkchops[i] == 3) then
			trial_LI.present();
		elseif (porkchops[i] == 4) then
			trial_RI.present();
		end; #ends if/elseif regarding stimulus presentation
		stimulus_data last_stim_data = stimulus_manager.last_stimulus_data();
        reaction_time = last_stim_data.reaction_time();
		if (reaction_time <= 465) then
			fast = true; #RT threshold dependent upon each participant's practice RT average
		else fast = false;
		end;
		if (response_manager.hits() == 1) && fast then
			current = true;
			points_fast.present();
		elseif (response_manager.hits() == 1) && fast == false then
			current = true;
			points_slow.present();
		else current = false;
		points_error.present();
		end; /*ends if/else specifying state that determines probability of
				playing white noise, where if current = true it remains at 4%
				and if current = false probability goes to 50%*/
		block_hits = block_hits + response_manager.hits();
		#this is how I keep track of accuracy within a trial to guide the feedback at the end
		if (previous && current) then
			int auditory = random(0,24);
			if auditory == 0 then
				trial_auditory_unpredictable.present();
				short_ISI.present(); # this ISI only ranges from 150-650ms because startle already took 350ms 
			else trial_ISI.present();
			end; #if both the last and the trial before it are accurate, white noise probability is 4%
		elseif (!previous && current) then
			int auditory = random(0,1);
			if auditory == 0 then
				trial_auditory_predictable.present();
				short_ISI.present(); # this ISI only ranges from 150-650ms because startle already took 350ms 
			else trial_ISI.present();
			end; #if the current trial was correct but the last trial was not, white noise probability is 50%
		else
			int auditory = random(0,1);
			if auditory == 0 then
				trial_auditory_error.present();
				short_ISI.present(); #this ISI only ranges from 150-650ms because startle already took 350ms 
			else trial_ISI.present();
			end; #otherwise, the probability should be 50%
		end;
		previous = current;
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