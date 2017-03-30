# Ruby
A ruby script, which scans my gmail for certain types of email, and does something "useful" with them


# Goal


-Different keywords to search for emails with different subjects +

-User input determines which emails will be printed +

-Printed email Titles will have a marking at the end, showing if the email has been already read or not
              *Decided that for now printing read emails is too much for testing and coding. 

-Get it to print in UTF-8!

# What have I done so far


-I found a ruby gem, which makes my code a lot shorter and easier

-I deleted 4000 unread emails (that took half an hour)

-Tried to restore some of the trashed emails, but haven't succeeded yet

-Update: Got most of the functions working that i wanted, but now a new problem has risen! My code won\t print the estonian characters. I tried .encode , .force_encode , .toutf8 and other combinations, but nothing seems to work.
