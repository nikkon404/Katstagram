import 'package:katstagram/model/post.dart';
import 'package:katstagram/model/user.dart';

List<Post> getData() {
  List<Post> postdata = new List<Post>();
  postdata.addAll([
    Post(
        user: User(
            dp:
                'https://toppng.com/uploads/preview/cat-face-11549457203qftaxrux3m.png',
            uname: 'kat404',
            fullName: 'Cute Cat'),
        caption: 'Just been showering with a friend. Meow.',
        img:
            'https://i.insider.com/5d02563ddaa4821bf4575092?width=1100&format=jpeg&auto=webp'),
    Post(
        user: User(
            dp:
                'https://australianchildrenspoetry.files.wordpress.com/2020/01/cat.png?w=584',
            uname: 'handsomeK',
            fullName: 'Handsome Cat'),
        caption: 'just CAME out of the box lol',
        img:
            'https://www.petmd.com/sites/default/files/cat-playing-with-boxes-and-toys-picture-id928511654.jpg'),
    Post(
        user: User(
            dp: 'https://avatarfiles.alphacoders.com/124/124420.jpg',
            uname: 'cat.34',
            fullName: 'James the cat'),
        caption:
            'Teach me how to smile bc smiling is ver important for your life',
        img:
            'https://allstarpetresort.com/wp-content/uploads/2017/10/Image_1.jpg'),
    Post(
        user: User(
            dp: 'https://d2ph5fj80uercy.cloudfront.net/06/cat2630.jpg',
            uname: 'mrcat',
            fullName: 'Mr Cat Person'),
        caption: 'Who doesn\'t like a cat meme?',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/5/52/Cat_Meme.jpg'),
    Post(
        user: User(
            dp:
                'https://news.artnet.com/app/news-upload/2019/01/Cat-Photog-Feat-256x256.jpg',
            uname: 'fluffy',
            fullName: 'Fluffy ball'),
        caption: 'Looks tasty, but isnt!',
        img:
            'https://c1.wallpaperflare.com/preview/320/621/303/cat-nori-just-nyan-arch.jpg'),
    Post(
        user: User(
            dp:
                'https://www.conceptionbaysouth.ca/cbs2019/wp-content/uploads/2020/05/Angel-adoption-photo-256x256.jpeg',
            uname: 'bella',
            fullName: 'Miss Bella'),
        caption: 'Say hello to mah doggo.',
        img:
            'https://p1.pxfuel.com/preview/1016/748/62/cat-dog-cute-pets-friendship-feline-royalty-free-thumbnail.jpg'),
    Post(
        user: User(
            dp: 'https://avatarfiles.alphacoders.com/121/121594.jpg',
            uname: 'devilcat',
            fullName: 'Devil Cat'),
        caption: 'Will I still be single? MeowX',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/0/02/Facebook_engancha.jpg'),
    Post(
        user: User(
            dp:
                'https://art-media.s3.amazonaws.com/media/public/tags/tag_cat%20portraits/2020-03-30T191942.8881580000.thumb.jpeg',
            uname: 'notdog',
            fullName: 'I am not a Dog'),
        caption:
            'Last weeks Bachelor Party with my cat homies. Had so much fun and looking forward to meet you guys soon!',
        img:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Louis_Wain_The_bachelor_party.jpg/1280px-Louis_Wain_The_bachelor_party.jpg'),
    Post(
        user: User(
            dp:
                'https://easysunday.com/blog/wp-content/uploads/2017/11/cat.jpg',
            uname: 'feedme',
            fullName: 'Hungry Kitty'),
        caption: 'I baked this after learning to make it from YouTube.',
        img:
            'https://p1.pxfuel.com/preview/662/807/649/cat-hare-deco-figure.jpg'),
    Post(
        user: User(
            dp:
                'https://pbs.twimg.com/profile_images/625633822235693056/lNGUneLX_400x400.jpg',
            uname: 'kittyx',
            fullName: 'The Name is Cat'),
        caption: 'My Favourite afternoon snack',
        img:
            'https://live.staticflickr.com/65535/48764371831_9c0708ebb8_b.jpg'),
    Post(
        user: User(
            dp:
                'https://pbs.twimg.com/profile_images/667804328267284482/ZO4Pw713_400x400.jpg',
            uname: 'boredKitty',
            fullName: 'I am Bored'),
        caption: 'My idol. Mr Thomas!',
        img:
            'https://cdn.pixabay.com/photo/2020/05/11/15/38/tom-5158824_960_720.png'),
  ]);

  return postdata;
}
