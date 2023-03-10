import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;
  final Function()? onTap;
  final Function()? onDelete;

  const CardCustom(
      {super.key,
      this.title,
      this.leading,
      this.subtitle,
      this.onTap,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Theme.of(context).backgroundColor,
              child: ListTile(
                leading: leading,
                title: title,
                subtitle: subtitle,
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onDelete!(),
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () => onTap!(),
    );
  }
}
