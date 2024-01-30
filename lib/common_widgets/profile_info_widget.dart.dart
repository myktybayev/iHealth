import 'package:flutter/material.dart';
import 'package:ihealth/models/channel_model.dart';

class BuildProfileInfo extends StatelessWidget {
  final Channel? channelParam;

  const BuildProfileInfo({
    Key? key,
    this.channelParam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channel = channelParam;

    return channel != null
        ? Container(
            margin: EdgeInsets.all(25.0),
            padding: EdgeInsets.all(20.0),
            height: 100.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 1),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: 12.0),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35.0,
                  backgroundImage: NetworkImage(channel.profilePictureUrl),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        channel.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${channel.subscriberCount} subscribers',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
