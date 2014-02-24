ExtensiveCell
============

iOS TableViewCell component

![alt tag](https://raw2.github.com/Tgy31/ExtensiveCell/master/screen.gif)

ECTableViewDataSource
============
 

		- (UITableViewCell *)extensiveCellForRowIndexPath:(NSIndexPath *)indexPath;

 Similar to `tableView:cellForRowAtIndexPath:` from `UITableViewDataSource`.
 
 Asks the data source for a cell to insert in a particular location of the table view. (required)
 The returned ExtensiveCell object is frequently one that the application reuses for performance reasons.
 You should fetch a previously created cell object that is marked for reuse by sending a dequeueReusableCellWithIdentifier: message to tableView.
 
 The container displayed do not interfer with the indexPath.
 ECViewController manages the indexPath when you open/close a row. ECViewController will call viewForContainerAtIndexPath: to get the container view.
 


		- (UIView *)viewForContainerAtIndexPath:(NSIndexPath *)indexPath;

 Asks the data source for a view to display in the container when selecting a row.
 You should fetch a previously created view object for performance reasons.
 
 The ECViewcontroller tableview only has one container and reuses it.



		- (CGFloat)heightForExtensiveCellAtIndexPath:(NSIndexPath *)indexPath;
 
 Similar to `tableView:heightForRowAtIndexPath:` from `UITableViewDelegate`.
 
 Must return the height for the row at indexPath.
 
 The container displayed do not interfer with the indexPath.
 `yECViewControlle` manages the indexPath when you open/close a row. `ECViewController` will size the container to fit its given view.



		- (NSInteger)numberOfSections;

 Similar to `numberOfSectionsInTableView:` from `UITableViewDataSource`.


		- (NSInteger)numberOfRowsInSection:(NSInteger)section;

 Similar to `tableview:numberOfRowsInSection:` from `ITableViewDataSource`.
 Do not consider the container (open or closed) when calculating the number of rows.



		- (void)extendCellAtIndexPath:(NSIndexPath *)indexPath;

 Extends the cell at given indexPath. If an other cell is already extended, it closes.
 Only one cell can be extended at once. 



