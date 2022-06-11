import 'package:flash_app/models/models.dart';
import 'package:flutter/material.dart';

class EpisodesScreen extends StatelessWidget {
  final List<Episodes> episodes;
  final ModelImage images;
  late BuildContext _context;
  EpisodesScreen({
    Key? key,
    required this.episodes,
    required this.images,
  }) : super(key: key);
//Dialog for displaying summary
  summary(String? summary) {
    showDialog(
        context: _context,
        builder: (context) => Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  color: Colors.red.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      summary.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Flash Episodes"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(158, 214, 22, 22),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(images.original.toString()),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
              ),
              itemCount: episodes.length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      summary(episodes[index].summary);
                    },
                    child: Card(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            episodes[index].image!.original!,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  episodes[index].name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15.0),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0.0,
                            left: 0.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    color: Colors.black,
                                    child: Text(
                                      " Season ${episodes[index].season.toString()}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    color: Colors.red,
                                    child: Text(
                                      " Episode ${episodes[index].number.toString()}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
