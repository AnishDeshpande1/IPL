BEGIN { start = 1; }
{
	if (insection1)
	{
		if ($0 != "")
		{
			action = $1;
			pattern = $2;
			action_count++;

			act_pattern[action_count] = pattern;


			#printf "Action %s Pattern %s\n", action, pattern;
		}
		else
			insection1 = 0;
	}
	### This order is important otherwise insection1 also prints "%%"
	if (start)
	{
		for (i=1; i <= NF; i++)
		{
			if ($i == "%%")
			{
				start = 0;
				insection1 = 1;
			}
		}
	}
	if ((NF ==3) && ($1 == "state"))
	{
		state_count++;
	}
	if ($4 == "accepts:")
	{
		state = $3;
		action = substr($5,2);
		action_num = action + 0;
		if (action_num <= action_count)
		{
			#printf "state %d action %s\n", state, act_pattern[action_num];
			acceptance_state_pattern[state+0] = act_pattern[action_num];
		}
	}
}
END{
	printf "#include<assert.h>\n";
	printf "#include<stdio.h>\n\n";
	printf "#include<string.h>\n";
	printf "int state_count = %d;\n", state_count;
	printf "char * action_pattern[%d] = {\n", state_count;
	for (i=0; i<state_count; i++)
	{
		if ((acceptance_state_pattern[i] != "") && (acceptance_state_pattern[i] != "End"))
			printf " \"%s\",", acceptance_state_pattern[i];
		else
			printf " NULL,";
	}	
	printf "};\n";
}
