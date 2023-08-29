import 'package:flutter/material.dart';

import '../components/glass_morphism.dart';

class VoucherIssue extends StatelessWidget {
  const VoucherIssue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      padding: const EdgeInsets.all(10.0),
      height: 250.0,
      width: 500.0,
      borderRadius: 12.0,
      borderWidth: 2.0,
      blurValue: 20.0,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Vouchers",
                style: TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.close_rounded),
                iconSize: 22,
                color: Colors.red,
              )
            ],
          ),
        ],
      ),
    );
  }
}
