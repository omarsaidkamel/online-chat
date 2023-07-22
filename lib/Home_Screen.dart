import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
        body: ListView.separated(
            itemBuilder: (context,index){
              return Card(
                color: Colors.purple[400],
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('https://www.imperial.ac.uk/ImageCropToolT4/imageTool/uploaded-images/newseventsimage_1666813382026_mainnews2012_x4.jpg'),
                            radius: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Omar Said',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.verified_rounded),
                                  ],
                                ),
                                Text('January 21,2021 at 11:00 pm'),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0,top: 8),
                        child: Container(
                          color: Colors.blue,
                          width: double.infinity,
                          height: 1,
                        ),
                      ),
                      Column(
                        children: [
              ReadMoreText(
              '''Why is ChatGPT4 called the AI   of Marketing and Advertising?
Take a look at what ChatGPT4 can do below and you will understand
 - Data Analytics: 𝐆𝐏𝐓4 can analyze data to understand customer behavior and uncover trends, supply and demand, and trends in the advertising sector.
- Analysis of leads: 𝐆𝐏𝐓4can analyze customer data and make advertising recommendations based on previous purchase behavior, registration information, search history, etc.
- Smart ad objects: 𝐆𝐏𝐓4 can automatically create smart ad objects to increase interactivity, with factors such as age, gender, geographic location and interest.
- Optimize ads: use Machine learning to predict the performance of advertising campaigns based on historical data
use algorithms to optimize ad campaigns, from ad format, positioning, pricing and ad content. 𝐆𝐏𝐓4 can also track ad results and re-optimize campaigns over time.
- Deep Learning: 𝐆𝐏𝐓4 can use Deep Learning to analyze images and videos to determine appropriate and effective advertising content.
With these technologies, 𝐆𝐏𝐓4I can help advertisers optimize their campaigns for greater efficiency, cost savings, and increased sales.
Try the trial version here, because the number of trial installations is limited, so hurry up.'''
              ,trimLines: 10,
              colorClickableText: Colors.white,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(overflow: TextOverflow.ellipsis),
              ),
                          SizedBox(height: 5,),
                          Image(
                            image: NetworkImage(
                              'https://scontent.fcai19-7.fna.fbcdn.net/v/t39.30808-6/339125124_242620178322986_3928765813132236737_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=h8xhqm3oAY0AX9SkjQ2&_nc_ht=scontent.fcai19-7.fna&oh=00_AfCX_sxUICFKvHlQ5dpu6vIaR-rpdsRXl8drRJ3Z8QEwvQ&oe=642D216B',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  child: Row(
                                    children: [
                                      Icon(Icons.celebration_rounded),
                                      Text(' 120'),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  child: Row(
                                    children: [
                                      Icon(Icons.mark_unread_chat_alt),
                                      Text(' 120 comments'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0,top: 8),
                        child: Container(
                          color: Colors.blue,
                          width: double.infinity,
                          height: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage('https://www.imperial.ac.uk/ImageCropToolT4/imageTool/uploaded-images/newseventsimage_1666813382026_mainnews2012_x4.jpg'),
                                    radius: 20,
                                  ),
                                  SizedBox(width: 5,),
                                  Text('Write a comment ...')
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.celebration_rounded),
                              Text(' Like'),
                            ],
                          ),
                          SizedBox(width: 15),
                          Row(
                            children: [
                              Icon(Icons.share),
                              Text(' Share'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context,index)=>SizedBox(height: 5,),
            itemCount: 20
        ),
    );
  }
}
