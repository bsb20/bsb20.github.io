---
layout: 421
title: Code Reviews
permalink: /421_f26/code_reviews
---

{%- assign crs = site.data.comp421.f26.code_reviews -%}


# Code Reviews

Twice during the semester you will meet one-on-one with a member of the course
staff for a **code review** of the course projects you have submitted. Each code
review is worth 7.5% of your grade (see [Policies](./policies)), so it is important to take these seriously.
The goal is to assess both your literacy with project concepts and your understanding of the code you submitted.

## Dates

| Code Review | When | Project Discussed |
|---|---|---|
{% for cr in crs -%}
{%- assign wk = cr[1].week_of -%}
| **{{ cr[1].name }}** | {% if wk == nil or wk == "" or wk == "TBD" %}TBD{% else %}Week of {{ wk | date: "%B %-d, %Y" }}{% endif %} | {{ cr[1].project }} |
{% endfor %}

## Signing Up

Reviews are slated for 30-minute slots that can be booked [on the Canvas calendar.](https://uncch.instructure.com/calendar#view_name=month&view_start=2026-10-01){:target="_blank"}
If none of the posted times work for you, contact the instructors to arrange an alternative.
**If you do not sign up for a review slot, or if you no-show your appointment without emailing the instructors, you will receive a score of 0.**
**If you are late to your review slot, you will be given credit for the portion of the review you complete.**

## General Expectations

- The review will consist of a roughly 25 minute, one-on-one conversation with a
  TA, LA, or instructor.
- Bring a laptop with your dev repo loaded up and ready to browse. Be
  prepared to open and navigate your source code.
- Our goal is to ask questions that probe your understanding (e.g., "what happens
  if this page is already pinned?", "why did you choose this latching order?").
- Even if you have made edits to your project after the submission deadline, you are expected to follow the course guidelines by presenting **your own work**.


## Format and Grading

The 25 minute review will be roughly divided into three sections.

1. An intro question about basic project functionality (5-7 minutes, 2 points)

2. A longer multi-part question about some detailed aspects of the project you just submitted (12-15 minutes, 3 points)

3. A high-level question to gauge your understanding of the project you are currently working on (5-7 minutes, 2 points)

Your specific answers to these questions will comprise 7 of the 10 points possible and will be graded according to a question-specific rubric.  The remaining 3 points will be awarded based on the following *yes/no* criteria that gauge your progress on the projects:

1. Shows general ability to navigate the codebase with an understanding of major system components and how they fit together (1 point)

2. Can relate abstract ideas discussed in lecture to specific implementation components in order to reason about design decisions (1 point)

3. Can express understanding of the material through a combination of speaking, writing/drawing diagrams, and code examples (1 point)

You will not be allowed to use generative AI or internet search during the review.  However, if you ask the TA/instructor a clarifying question that could be easily looked up, they may elect to search it up for you.  For example, if you want to know the function signature for a particular C++ std library function, that could be looked up (i.e., don't spend your time memorizing things that are easily looked up and likely immaterial to the above questions).

You can bring in one double-sided page of hand-written notes.  If reviewing these notes becomes an obstacle to having a productive conversation with the instructor in the allotted time, it could affect your score on the above criteria.  We will be reasonable here, please be reasonable in return.


## How to Prepare

- Be prepared to explain known issues with your solution to the projects
- Come to office hours to discuss aspects of the project you do not understand.
- As a good review exercise, re-read the project descriptions task-by-task.  See if you can diagram your solution to each task on paper or whiteboard.  Identify the major system components/classes you worked on.
- Look at where you stack up on the leaderboard.  If you are at the top, see if you can explain why.  If you are not at the top, see if you can explain why.
- See the sample questions below.
- Maybe: try interacting with these questions via the [LearnWithAI chatbot activity](https://learnwithai.unc.edu/courses/27/timeline){:target="_blank"}. **Note: this is optional and is an experimental course feature.  We do not make any guarantees about the quality of responses you will get.  We cannot even guarantee that you won't accidentally hack Hugging Face.**





