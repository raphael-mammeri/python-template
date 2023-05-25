
# Measure theory
## Introduction
Measure theory is a branch of mathematics that provides a rigorous framework for understanding and quantifying the concept of "size" or "measure" of sets. It deals with the study of measures, which are functions that assign a non-negative real number to subsets of a given set.


In probability theory,  measure theory introduces key concepts such as 
probability spaces, sample spaces and events. The numerical values that are 
assigned to events will capture the likelihood or uncertainty of outcomes.
These concepts establish a solid foundation for studying probabilistic 
models and their properties.

 Let's see an illustration in the case of real number $\mathbb{R}.$

## Lebesgue Measure on Real Numbers
Consider an interval  $I = [a, b] \subset \mathbb{R}$  where $b>a.$ 
The most 
natural measure one would assign to the interval $I$ would be $b-a.$ 
This would also have been the natural measure if 
one or 
its two sides of $I$ were open. Let's note this "measure" $\mu.$


We also would want this definition to be extended to any set that can be 
expressed as the disjoint
union of intervals as follows : if $E \subset \mathbb{R}$ can be writen as 
a disjoint union of intervals $I_i$ for $i$ in some index set $S,$ then we 
would 
define the measure of $E$ as the sum measures of the different 
intervals $I_i$ :

$$
\mu(E) = \sum_{i \in S} \mu(I_i) = \sum_{i \in S} (b_i - a_i)
$$
where $a_i < b_i \in \mathbb{R}$ are the sides of the interval $I_i.$

* Is this definition mathematically coherent, meaning does it lead to 
  mathematical contradictions ?
* Does it make sens if the index set $S$ is infinite ?
* Can we extend this definition to any subset of $\mathbb{R}$ ?
* If it can not be extended to all subsets of $\mathbb{R}$ is there a 
  smaller collection of subsets of $\mathbb{R}$ to which we can extend the 
  definition of $\mu$ ?

These questions are addressed by defining the notions of $\sigma$-algebras, 
measurable spaces and a proper 
definition of a measure and with some tools like the measure 
extension theorem.
In this example the collection of sets on which we can extend the set 
function $\mu$ is called the Borel $\sigma$-algebra and $\mu$ is called the 
Lebesgue measure. We will develop their construction in the next subsections.




