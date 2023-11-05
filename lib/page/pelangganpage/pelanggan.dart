import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// class MyPelangganPage extends StatelessWidget {
//   const MyPelangganPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 160, 65, 100),
//         title: const Text('Daftar Pelanggan'),
//       ),
//       body: const Center(child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//             Text('Input Pelanggan'),
//           ],
        
//       )),
//     );
//   }
// }

class MyPelangganPage extends StatefulWidget {
  const MyPelangganPage({super.key});

  @override
  State<MyPelangganPage> createState() => _MyPelangganPage();
}

class _MyPelangganPage extends State<MyPelangganPage> {
  // text field controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  final CollectionReference _pelanggan =
      FirebaseFirestore.instance.collection('pelanggan');

  String searchText = '';
  // for create operation
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Create your item",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'eg.Elon'),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _alamatController,
                  decoration:
                      const InputDecoration(labelText: 'Alamat', hintText: 'eg.JL.Almutaqien Rt1/12 no.22 Palembang'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _numberController,
                  decoration: const InputDecoration(
                      labelText: 'No. telp', hintText: 'eg.081297985653'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = _nameController.text;
                      final String alamat = _alamatController.text;
                      final int? number = int.tryParse(_numberController.text);
                      if (number != null) {
                        await _pelanggan
                            .add({"name": name, "number": number, "alamat": alamat});
                        _nameController.text = '';
                        _alamatController.text = '';
                        _numberController.text = '';

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Create"))
              ],
            ),
          );
        });
  }

  // for Update operation
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _alamatController.text = documentSnapshot['alamat'].toString();
      _numberController.text = documentSnapshot['number'].toString();
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Update your item",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'eg.Elon'),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: _alamatController,
                  decoration:
                      const InputDecoration(labelText: 'Alamat', hintText: 'eg.JL.Almutaqien Rt1/12 no.22 Palembang'),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _numberController,
                  decoration: const InputDecoration(
                      labelText: 'No. telp', hintText: 'eg.081239128313'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String name = _nameController.text;
                      final String alamat = _alamatController.text;
                      final int? number = int.tryParse(_numberController.text);
                      if (number != null) {
                        await _pelanggan
                            .doc(documentSnapshot!.id)
                            .update({"name": name, "number": number, "alamat": alamat});
                        _nameController.text = '';
                        _alamatController.text = '';
                        _numberController.text = '';

                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text("Update"))
              ],
            ),
          );
        });
  }

  // for delete operation
  Future<void> _delete(String productID) async {
    await _pelanggan.doc(productID).delete();

    // for snackBar
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You have successfully deleted a itmes")));
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
    });
  }

  bool isSearchClicked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 65, 100),
        title: isSearchClicked
            ? Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 165, 195),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                      hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      border: InputBorder.none,
                      hintText: 'Search..'),
                ),
              )
            : const Text('Pelanggan'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                });
              },
              icon: Icon(isSearchClicked ? Icons.close : Icons.search))
        ],
      ),
      body: StreamBuilder(
        stream: _pelanggan.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> pelanggan = streamSnapshot.data!.docs
                .where((doc) => doc['name'].toLowerCase().contains(
                      searchText.toLowerCase(),
                    ))
                .toList();
            return ListView.builder(
                itemCount: pelanggan.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = pelanggan[index];
                  return Card(
                    color: const Color.fromARGB(255, 160, 65, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 17,
                        backgroundColor: Color.fromARGB(255, 255, 165, 195),
                        child: Icon(Icons.people_rounded, color: Color.fromARGB(255, 0, 0, 0),),
                      ),
                      title: Text(
                        documentSnapshot['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      subtitle: Text(documentSnapshot['number'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                onPressed: () => _update(documentSnapshot),
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                onPressed: () => _delete(documentSnapshot.id),
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Create new project button
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        backgroundColor: const Color.fromARGB(255, 160, 65, 100),
        child: const Icon(Icons.add),
      ),
    );
  }
}