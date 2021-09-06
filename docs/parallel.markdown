---
layout: default 
title: Parallel Scheduling 
permalink: /parallel/
---
# Scheduling Parallelizable Jobs

My main research focus is in the area of scheduling parallelizable jobs.
Here, we have some set of servers that can be allocated to stream of incoming jobs.
Our goal is to minimize the response times of these jobs --- the time from when a job arrives to the system until it is complete.
Unlike most of the literature on scheduling and queueing, parallelizable jobs can run on more than one server at a time.
Running on additional servers allows a job to complete more quickly.
In practice, however, parallelizing a job incurs overhead.
Hence, jobs do not receive a perfect speedup from running on additional servers --- a job will not run twice as fast on two servers, but it might run 1.5 times as fast.
Deciding how to best allocate servers to jobs requires balancing several tradeoffs.

One must decide how to balance the tradeoff between running an individual job faster versus maximizing the efficiency of the system.
Parallelizing a job makes that individual job run faster, but the overhead from this parallelism causes the system to run less efficiently and could potentially increase the response times of other jobs in the system.
While this tradeoff is hard to balance, we can show [in some cases](https://arxiv.org/abs/1707.07097) that the optimal policy is to maximize efficiency.

When job size information is known to the system, the story becomes even more complicated.
Traditionally, scheduling policies aim to reduce response times by prioritizing short jobs over long jobs.
We can favor short jobs by parallelizing them more aggressively, but this works against the notion that one should maximize system efficiency.
To balance this tradeoff, we developed the [high-efficiency SRPT](https://arxiv.org/pdf/2011.09676.pdf) policy which calculates the optimal balance between system efficiency and the desire to favor short jobs.

Perhaps the least obvious tradeoff in my work arises when considering workloads where some jobs are more parallelizable than others.
Here, one might think to maximize the system efficiency by favoring the more parallelizable jobs in the system.
However, it turns out that these more parallelizable jobs give the system a lot of flexibility, and it can help to save them for later by favoring the less parallelizable jobs.
We refer to this as **deferring parallelizable work**.
Deciding when to defer parallelizable work is hard, but we have attacked [the problem](https://arxiv.org/abs/1707.07097) from [many angles](https://dl.acm.org/doi/pdf/10.1145/3350755.3400265) and [continue](/publications/) to work in this area.

For a nice summary of how we think about these tradeoffs, you can see the invited talk I gave at Red Hat Research Day in 2020.


# Red Hat Research Day 2020:
<iframe width="560" height="315" src="https://www.youtube.com/embed/3pF4l0YMODI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
