const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { Outlet, ProductCategory, OutletCategory } = this.entities;

    this.on('addAllCategoriesToAllOutlets', async () => {
        try {
            // Fetch all outlets and categories
            const [outlets, categories] = await Promise.all([
                cds.run(SELECT.from(Outlet)),
                cds.run(SELECT.from(ProductCategory))
            ]);

            // Prepare promises to link each outlet with each category
            // Ensuring proper referencing of the associated entities based on the ID fields
            const categoryPromises = outlets.reduce((acc, outlet) => [
                ...acc,
                ...categories.map(category => INSERT.into(OutletCategory).entries({
                    outlet_ID: outlet.ID, // Use the ID field for association
                    productCategory_ID: category.ID // Use the ID field for association
                }))
            ], []);

            // Execute all promises
            await Promise.all(categoryPromises);
        } catch (error) {
            console.error("Error in addAllCategoriesToAllOutlets:", error);
        }
    });

    this.after('CREATE', 'ProductCategory', async (category, req) => {
        const outlets = await cds.run(SELECT.from(Outlet));

        // Prepare and execute promises to link the new category with each outlet
        // Ensuring proper referencing of the associated entities based on the ID fields
        const outletCategoryPromises = outlets.map(outlet => INSERT.into(OutletCategory).entries({
            outlet_ID: outlet.ID, // Use the ID field for association
            productCategory_ID: category.ID // Use the ID field for association
        }));

        await Promise.all(outletCategoryPromises);
    });
});
