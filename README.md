# ruby-binary-search-tree
Balanced Binary Search Tree project in Ruby, assignment from The Odin Project

- ASSIGNMENT:

  - Build a balanced BST in this assignment. Do not use duplicate values because they make it more complicated
   and result in trees that are much harder to balance. Therefore, be sure to always remove duplicate values 
   or check for an existing value before inserting.

- Specifications: 

  - Build a Node class. It should have an attribute for the data it stores as well as its left and right children. As a bonus, try including the Comparable module and compare nodes using their data attribute.

  - Build a Tree class which accepts an array when initialized. The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.

  - Write a #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove  duplicates!). The #build_tree method should return the level-0 root node.

  - Write an #insert and #delete method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not). If you need additional resources, check out these two articles on inserting and deleting, or this video with several visual examples.

  - Write a #find method which accepts a value and returns the node with the given value.

  - Write a #level_order method which accepts a block. This method should traverse the tree in breadth-first level order and yield each node to the provided block. This method can be implemented using either iteration or recursion (try implementing both!). The method should return an array of values if no block is given.

  - Write #inorder, #preorder, and #postorder methods that accepts a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. The methods should return an array of values if no block is given.

  - Write a #height method which accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.

  - Write a #depth method which accepts a node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.

  - Write a #balanced? method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.

  - Write a #rebalance method which rebalances an unbalanced tree. 

  Tie it all together
  Write a simple driver script that does the following:
  
  - Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
  - Confirm that the tree is balanced by calling #balanced?
  - Print out all elements in level, pre, post, and in order
  - Unbalance the tree by adding several numbers > 100
  - Confirm that the tree is unbalanced by calling #balanced?
  - Balance the tree by calling #rebalance
  - Confirm that the tree is balanced by calling #balanced?
  - Print out all elements in level, pre, post, and in order