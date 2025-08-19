Problem Statement for script1.sh:-
AUTOMATE THE JOURNAL SETUP.

I try to journal but I always struggle with organisation of my journals in their respective months. I try to do it on apps like Notion, but the tasks is very repititive and draining. 
I do not want to do the same manual work again and again.
Adding journal for many days on the same page does not sit very right with me. 
I like the idea of having a separate file for each day instead of combining all entries into a singleone.
I need a way to create directories named as months and text files named as days of the months to journal.

ARGUMENTS:-
./script1.sh Sept 30 Oct 31 Nov 30 Dec 31
I will arguments in pairs. For every pair (Setp, 30) the first argument will be the name of the directory and the second argument will be the number of files in that directory.

This will create 4 directories by the name of Sept, Oct, Nov, Dec.
Sept will have 30 text files numbered 1_Sept.txt to 30_Sept.txt.
Each .txt file will have it's name as heading. So 1_Sept.txt will have the heading 1 Sept
--------------------
INPUT:-
NO INPUT
-------------------
What this solves:-
1. Time wasted creating repetitive structures.
2. Since for every day there is a separate file, the cognitive load of deciding where to write has been removed.
3. I can add as many months as I want in a single run.

-----------------------END OF PROBLEM STATEMENT 1-----------------------





Problem Statement for script2.sh:-
SEQUENTIALLY NUMBER IMAGES, BASED ON THEIR TIME OF ARRIVAL.

I enjoy collecting and saving images from different sources in my laptop:
1. Memes from Instagram,
2. Wallpapers from Pinterest,
3. Manga panels I find interesting or visually striking.
Most of the time, I save them directly into a folder on my computer. Sometimes, I even convert them into a PDF collection for easier reading later.
Problem:-
My system allows me to sort images by date, but when multiple images are saved on the same date, I cannot sort them based on time of arrival.
Within that day, I cannot easily tell which image was saved first or last without manually checking their timestamps.
Additionally, the filenames are usually messy (e.g., IMG_0293.jpg, Screenshot_20250819.png, or random hashed names from the internet).
This leads to confusion when I want to create a chronological collection of my saved images.

So, I need a script that:
Takes all images in a given directory.
Sorts them by timestamp of creation/modification.
Renames them into sequential order (1.jpg, 2.jpg, 3.jpg, …).

ARGUMENTS:-
Single argument = Directory name that contains the images.
Example = ./script2.sh images

INPUT:-
Folder containing images (jpg/jpeg/png), e.g., 'images'

What this solves:-
1. Chronological ordering of images - Good for manga panels and storytelling.
2. Consistency in naming - 1.jpeg, 2.jpeg etc.
3. Easy pdf creation - Final pdf will be ordered correctly.

-----------------------END OF PROBLEM STATEMENT 2-----------------------





Problem Statement for script3.sh:-
LIVE WORD COUNTER FOR A TEXT FILE

When working on a text file, I often want to track the current word count in real time.
Normally, I would stop writing, save the file, and manually run wc -w file.txt to check how many words I have written. 
This breaks my flow, wastes time, and forces me to repeat the same command again and again.

To avoid this repetitive manual work, I want an automated script that:
1. Reads my .txt file.
2. Counts the words inside it every second.
3. Upon saving the document. Shows the number of words in the file on the terminal.

ARGUMENTS:-
Single .txt file that we wish to track.
./script3.sh input/word_counter.txt

INPUTS:-
Single .txt file in the input directory named, word_counter.txt

-----------------------END OF PROBLEM STATEMENT 3-----------------------





Problem Statement for script4.sh:-
I frequently download images from various sources like social media. Over time, my image folder becomes cluttered with hundreds or even thousands of files. Often, I unknowingly end up with duplicate images - sometimes with different filenames or saved at different times.
Manually identifying and removing these images is time consuming, tedious, and error prone, especially when dealing with large collections. I need a more reliable and automated way to do it.

What does the script do:-
It scans all images in the folder, detects duplicates using checksums, keeps only one copy of each unique image, and deletes duplicates automatically.

ARGUMENTS:-
Single argument, image folder which I wish to clean.
Example = ./script4.sh input/images_script4

INPUT:-
Image folder named 'images_script4' in the folder 'input'.