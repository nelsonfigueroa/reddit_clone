User.create!([
  {email: "nelson@gmail.com", encrypted_password: "$2a$11$GAw6ZLTSB2/A2yyrdR9LXOf1RtQNYDF2tFw5ka8h24tnBqR1pFV/q", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 5, current_sign_in_at: "2019-05-15 07:09:18", last_sign_in_at: "2019-05-15 06:53:35", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", username: "devnelson"},
  {email: "bob@gmail.com", encrypted_password: "$2a$11$akGFCWP5WwYq3vL01zjT3.XvS0GYB0wycGH.uoJf2YOJKofDvzMkm", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 1, current_sign_in_at: "2019-05-10 20:32:44", last_sign_in_at: "2019-05-10 20:32:44", current_sign_in_ip: "::1", last_sign_in_ip: "::1", username: "bob"},
  {email: "john@gmail.com", encrypted_password: "$2a$11$FYJw19VJ.Qy1xsi4.824LuBjBWUPbOGjKMgZSeQjMjEzH566ZTt0i", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 1, current_sign_in_at: "2019-05-10 20:35:06", last_sign_in_at: "2019-05-10 20:35:06", current_sign_in_ip: "::1", last_sign_in_ip: "::1", username: "john"},
  {email: "david@gmail.com", encrypted_password: "$2a$11$aZ6Jb1Cinb61Av9EWcfm4eJsFaWZim4F9AY96BXtAY23Zei9ogQwG", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 1, current_sign_in_at: "2019-05-10 20:38:52", last_sign_in_at: "2019-05-10 20:38:52", current_sign_in_ip: "::1", last_sign_in_ip: "::1", username: "david"},
  {email: "rubyist@gmail.com", encrypted_password: "$2a$11$xA0JnxdDKz/wcHiZuSOIbeOLddKyxhypS1hv39lf/w2mDNQzGXWkC", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 1, current_sign_in_at: "2019-05-10 20:46:30", last_sign_in_at: "2019-05-10 20:46:30", current_sign_in_ip: "::1", last_sign_in_ip: "::1", username: "rubyist"},
  {email: "announcements@gmail.com", encrypted_password: "$2a$11$Zsg2jtql9WbKEck9FZx.hev.TxRV2393OKI4CBa2gAkRwnBd8Q8NW", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 1, current_sign_in_at: "2019-05-10 20:57:33", last_sign_in_at: "2019-05-10 20:57:33", current_sign_in_ip: "::1", last_sign_in_ip: "::1", username: "announcementsguy"},
  {email: "another@gmail.com", encrypted_password: "$2a$11$UO.HsmZY0hPbu6su0aPNauiIdSqvkN932jHw90IfMxjnQjv6Bf36u", reset_password_token: nil, reset_password_sent_at: nil, sign_in_count: 1, current_sign_in_at: "2019-05-10 21:06:05", last_sign_in_at: "2019-05-10 21:06:05", current_sign_in_ip: "::1", last_sign_in_ip: "::1", username: "anon"}
])
Comment.create!([
  {comment: "I've always used PHP and can't imagine using another language\n", user_id: 3, post_id: 2},
  {comment: "I agree! ", user_id: 4, post_id: 1},
  {comment: "Ruby is my personal favorite, it's easy to read ", user_id: 4, post_id: 2},
  {comment: "We also need the ability to delete posts that we created", user_id: 4, post_id: 3},
  {comment: "Can't go wrong with John the Ripper. ", user_id: 4, post_id: 4},
  {comment: "+1 for Ruby\n", user_id: 5, post_id: 2},
  {comment: "seed_dump is useful for creating seed data from existing data", user_id: 5, post_id: 5},
  {comment: "I think 'bullet' is known but yet I don't see it in many projects. It's a must-have!", user_id: 6, post_id: 5}
])
Post.create!([
  {title: "Are DM's coming in the future?", content: "It would be cool t continue conversations with users in private.", user_id: 7, sub_id: 1},
  {title: "Markdown support is coming! ", content: "Markdown support is coming in the near future. You'll be able to include links, lists, code fragments, and more.", user_id: 6, sub_id: 5},
  {title: "Useful, lesser-known gems?", content: "What are some useful gems that you guys know about?", user_id: 4, sub_id: 4},
  {title: "Best password cracking tool?", content: "There's a lot out there, and I don't know which one to use", user_id: 3, sub_id: 3},
  {title: "We need the ability to edit posts", content: "If I misspell something I can't go back and fix it", user_id: 3, sub_id: 1},
  {title: "What's your favorite backend language?", content: "Mine is JavaScript! I like the syntax and versatility.", user_id: 2, sub_id: 2},
  {title: "We should be able to upload images", content: "Just like other sites out there.\r\n", user_id: 2, sub_id: 1}
])
Sub.create!([
  {name: "Announcements", description: "Special announcements and site updates.", user_id: 6},
  {name: "CyberSecurity", description: "Securing your digital life is just as important.", user_id: 3},
  {name: "Ruby", description: "All about the Ruby programming language", user_id: 4},
  {name: "Suggestions", description: "Suggestions for the dev", user_id: 1},
  {name: "WebDev", description: "All things web development", user_id: 2}
])
Vote.create!([
  {user_id: 1, post_id: 3, upvote: false, downvote: true},
  {user_id: 1, post_id: 4, upvote: false, downvote: true},
  {user_id: 1, post_id: 5, upvote: false, downvote: true},
  {user_id: 1, post_id: 6, upvote: false, downvote: true},
  {user_id: 1, post_id: 7, upvote: false, downvote: true},
  {user_id: 1, post_id: 1, upvote: false, downvote: true}
])
