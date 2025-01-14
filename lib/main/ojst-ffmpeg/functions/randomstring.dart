import 'dart:math';

//This function returns a random string with a specified length. self explanatory but you know I love writing comments instead of being productive

String randomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return List.generate(length,
            (index) => chars[(chars.length * Random().nextDouble()).floor()])
        .join();
  }