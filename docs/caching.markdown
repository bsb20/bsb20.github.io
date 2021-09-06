---
layout: default 
title: Caching 
permalink: /caching/
---
# Caching in Large-Scale Web Services

Although they might seem different, both caching and scheduling parallelizable jobs are really resource allocation problems.
My research has focused on caching in large web services, which feature variable-sized objects and workloads which have traditionally been considered hard to cache.
Here, one must decide how to allocate limited cache space between a vast universe of objects when making cache eviction and admission decisions.

Our [Robinhood](https://www.usenix.org/system/files/osdi18-berger.pdf) paper tackles this problem by explicitly considering the multi-tier architecture of modern web services where a single user request must query several backend services. Instead of optimizing for the overall cache hit ratio, RobinHood explicitly optimizes the P99 of request latency by dynamically allocating cache space between different backend services.

What we found after developing RobinHood was that there were many barriers to deploying new and innovative caching systems in a modern production environment.  This led to my collaboration with Facebook on the publication of our [CacheLib paper](https://www.usenix.org/system/files/osdi20-berg.pdf).  CacheLib, which was recently made [open source](https://cachelib.org/), is a general-purpose caching engine which makes is easier to build and deploy caches at scale which leverage state-of-the-art caching policies and features.

One of the main ideas with CacheLib was to make it easier for new ideas from the caching literature to be adopted in production systems.  We have already started to see this trend with the publication of our [Kangaroo](/publications/) paper (to appear at SOSP 2021) which presents a new system for caching more efficiently using flash devices.  We were able to develop this system using CacheLib and deploy it straight into Facebook's production environment.

For a summary of my work on CacheLib, you can see my presentation from OSDI 2020 below.

# CacheLib Presentation, OSDI 2020:
<iframe width="560" height="315" src="https://www.youtube.com/embed/wp_X-Zg9WEo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
