import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../data/models/offers_model.dart';

class BidActions extends StatelessWidget {
  final OfferModel bid;

  const BidActions({
    required this.bid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _PriceChip(amount: bid.offeredPrice),

        if (bid.status == OfferStatus.pending) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              _BidActionIcon(
                  icon: Icons.check_rounded,
                  color: AppColors.successColor,
                  onPressed: () => {}
              ),
              const SizedBox(width: 4),
              _BidActionIcon(
                icon: Icons.handshake_rounded,
                color: AppColors.warningColor,
                onPressed: () {

                },
              ),
              const SizedBox(width: 4),
              _BidActionIcon(
                  icon: Icons.close_rounded,
                  color: AppColors.errorColor,
                  onPressed: () {
                  }
              ),
            ],
          ),
        ],
      ],
    );
  }
}
class _BidActionIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _BidActionIcon({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color.withOpacity(0.15),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 12, color: color),
        padding: EdgeInsets.zero,
      ),
    );
  }
}

///////////////////////////////////////////////////////////////
///                     🔵 PRICE CHIP                       ///
///////////////////////////////////////////////////////////////

class _PriceChip extends StatelessWidget {
  final double amount;

  const _PriceChip({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.successColor.withOpacity(0.15),
            AppColors.successColor.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'د.ع ${amount.toStringAsFixed(0)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.successColor,
          fontSize: 13,
        ),
      ),
    );
  }
}
