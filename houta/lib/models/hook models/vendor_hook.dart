import 'package:flutter/material.dart';
import 'package:houta/models/vendors_model.dart';
class FetchVendor{
  final VendorsModel? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchVendor({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });

}

