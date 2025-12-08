enum BidStatus {
  pending,
  accepted,
  rejected,
  cancelled,
  expired,
  negotiating,
}

extension BidStatusExtension on BidStatus {
  String get displayName {
    switch (this) {
      case BidStatus.pending:
        return 'Pending';
      case BidStatus.accepted:
        return 'Accepted';
      case BidStatus.rejected:
        return 'Rejected';
      case BidStatus.cancelled:
        return 'Cancelled';
      case BidStatus.expired:
        return 'Expired';
      case BidStatus.negotiating:
        return 'Negotiating';
    }
  }

  String get description {
    switch (this) {
      case BidStatus.pending:
        return 'Waiting for load owner decision';
      case BidStatus.accepted:
        return 'Bid accepted - shipment created';
      case BidStatus.rejected:
        return 'Bid was not selected';
      case BidStatus.cancelled:
        return 'Bid cancelled by transporter';
      case BidStatus.expired:
        return 'Bid expired due to time limit';
      case BidStatus.negotiating:
        return 'In negotiation with load owner';
    }
  }
}
